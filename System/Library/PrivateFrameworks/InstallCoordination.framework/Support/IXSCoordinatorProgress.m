@interface IXSCoordinatorProgress
+ (double)_computeOverallProgressForCurrentProgress:(double)a3 progressPhase:(unint64_t)a4 progressHint:(id)a5;
- (BOOL)needsPostProcessing;
- (BOOL)progressCompleted;
- (IXApplicationIdentity)identity;
- (IXProgressHint)progressHint;
- (IXSCoordinatorProgressDelegate)delegate;
- (double)currentPhaseProgress;
- (id)description;
- (id)initForCoordinatorWithIdentity:(id)a3 totalUnits:(unint64_t)a4 progressHint:(id)a5 needsPostProcessing:(BOOL)a6 delegate:(id)a7;
- (unint64_t)progressPhase;
- (unint64_t)totalUnits;
- (unint64_t)totalUnitsCompleted;
- (void)_notifyDelegateAndUpdateProgressWithPhaseCompleted:(BOOL)a3;
- (void)finishInstalling;
- (void)finishLoading;
- (void)finishPostProcessing;
- (void)setCurrentPhaseProgress:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setNeedsPostProcessing:(BOOL)a3;
- (void)setProgressCompleted:(BOOL)a3;
- (void)setProgressHint:(id)a3;
- (void)setProgressPhase:(unint64_t)a3;
- (void)setTotalUnits:(unint64_t)a3;
- (void)setTotalUnitsCompleted:(unint64_t)a3;
@end

@implementation IXSCoordinatorProgress

- (id)initForCoordinatorWithIdentity:(id)a3 totalUnits:(unint64_t)a4 progressHint:(id)a5 needsPostProcessing:(BOOL)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)IXSCoordinatorProgress;
  v16 = [(IXSCoordinatorProgress *)&v19 init];
  p_isa = (id *)&v16->super.isa;
  if (v16)
  {
    v16->_progressPhase = 0;
    v16->_currentPhaseProgress = 0.0;
    v16->_totalUnitsCompleted = 0;
    v16->_totalUnits = a4;
    v16->_progressCompleted = 0;
    v16->_needsPostProcessing = a6;
    objc_storeStrong((id *)&v16->_progressHint, a5);
    objc_storeStrong(p_isa + 7, a3);
    objc_storeWeak(p_isa + 8, v15);
  }

  return p_isa;
}

- (id)description
{
  v3 = [(IXSCoordinatorProgress *)self identity];
  unint64_t v4 = [(IXSCoordinatorProgress *)self progressPhase];
  if (v4 >= 3)
  {
    v5 = +[NSString stringWithFormat:@"Unknown progress value %lu", v4];
  }
  else
  {
    v5 = off_1000E92B8[v4];
  }
  [(IXSCoordinatorProgress *)self currentPhaseProgress];
  v7 = +[NSString stringWithFormat:@"Progress for coordinator: %@, Phase: %@, Percentage: %f", v3, v5, v6];

  return v7;
}

- (void)finishLoading
{
  if (![(IXSCoordinatorProgress *)self progressPhase])
  {
    self->_totalUnitsCompleted = self->_totalUnits;
    [(IXSCoordinatorProgress *)self _notifyDelegateAndUpdateProgressWithPhaseCompleted:1];
    [(IXSCoordinatorProgress *)self setProgressPhase:1];
    [(IXSCoordinatorProgress *)self setCurrentPhaseProgress:0.0];
    self->_totalUnitsCompleted = 0;
    self->_totalUnits = 0;
  }
}

- (void)finishInstalling
{
  if ((id)[(IXSCoordinatorProgress *)self progressPhase] == (id)1
    && ![(IXSCoordinatorProgress *)self progressCompleted])
  {
    uint64_t v3 = [(IXSCoordinatorProgress *)self needsPostProcessing] ^ 1;
    [(IXSCoordinatorProgress *)self setProgressCompleted:v3];
    self->_totalUnitsCompleted = self->_totalUnits;
    [(IXSCoordinatorProgress *)self _notifyDelegateAndUpdateProgressWithPhaseCompleted:1];
    if ((v3 & 1) == 0)
    {
      [(IXSCoordinatorProgress *)self setProgressPhase:2];
      [(IXSCoordinatorProgress *)self setCurrentPhaseProgress:0.0];
      self->_totalUnitsCompleted = 0;
      self->_totalUnits = 0;
    }
  }
}

- (void)finishPostProcessing
{
  if ((id)[(IXSCoordinatorProgress *)self progressPhase] == (id)2
    && ![(IXSCoordinatorProgress *)self progressCompleted])
  {
    [(IXSCoordinatorProgress *)self setProgressCompleted:1];
    self->_totalUnitsCompleted = self->_totalUnits;
    [(IXSCoordinatorProgress *)self _notifyDelegateAndUpdateProgressWithPhaseCompleted:1];
  }
}

+ (double)_computeOverallProgressForCurrentProgress:(double)a3 progressPhase:(unint64_t)a4 progressHint:(id)a5
{
  id v7 = a5;
  v8 = v7;
  double v9 = 0.0;
  if (a4 <= 2)
  {
    v10 = [v7 loadingPhaseProportion];
    if (a4)
    {
      v11 = [v8 loadingPhaseProportion];
      [v11 doubleValue];
      double v9 = v12 * 100.0;

      id v13 = [v8 installingPhaseProportion];

      if (a4 == 1)
      {
        v10 = v13;
      }
      else
      {
        id v14 = [v8 installingPhaseProportion];
        [v14 doubleValue];
        double v9 = v9 + v15 * 100.0;

        v10 = [v8 postProcessingPhaseProportion];
      }
    }
    [v10 doubleValue];
    double v9 = v9 + a3 * v16;
  }
  return v9;
}

- (void)_notifyDelegateAndUpdateProgressWithPhaseCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(IXSCoordinatorProgress *)self totalUnits])
  {
    double v5 = (double)[(IXSCoordinatorProgress *)self totalUnitsCompleted];
    double v6 = v5 / (double)[(IXSCoordinatorProgress *)self totalUnits] * 100.0;
    [(IXSCoordinatorProgress *)self currentPhaseProgress];
    if (v6 - v7 >= 1.0 || v3)
    {
      [(IXSCoordinatorProgress *)self setCurrentPhaseProgress:v6];
      double v9 = [(IXSCoordinatorProgress *)self delegate];
      if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v10 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_10008C2B8((uint64_t)self, v10);
        }

        unint64_t v11 = [(IXSCoordinatorProgress *)self progressPhase];
        double v12 = [(IXSCoordinatorProgress *)self progressHint];
        +[IXSCoordinatorProgress _computeOverallProgressForCurrentProgress:v11 progressPhase:v12 progressHint:v6];
        double v14 = v13;

        objc_msgSend(v9, "didUpdateProgress:forPhase:overallProgress:", -[IXSCoordinatorProgress progressPhase](self, "progressPhase"), v6, v14);
      }
    }
  }
}

- (void)setTotalUnitsCompleted:(unint64_t)a3
{
  if ([(IXSCoordinatorProgress *)self progressCompleted] || self->_totalUnitsCompleted >= a3)
  {
    double v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      double v9 = "-[IXSCoordinatorProgress setTotalUnitsCompleted:]";
      __int16 v10 = 2112;
      unint64_t v11 = self;
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@: Attempt to set units completed on finished progress: %llu", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    unint64_t v5 = [(IXSCoordinatorProgress *)self totalUnits];
    if (v5 >= a3) {
      unint64_t v6 = a3;
    }
    else {
      unint64_t v6 = v5;
    }
    self->_totalUnitsCompleted = v6;
    [(IXSCoordinatorProgress *)self _notifyDelegateAndUpdateProgressWithPhaseCompleted:0];
  }
}

- (void)setTotalUnits:(unint64_t)a3
{
  if (self->_totalUnits != a3)
  {
    if ([(IXSCoordinatorProgress *)self progressCompleted])
    {
      unint64_t v5 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        double v7 = "-[IXSCoordinatorProgress setTotalUnits:]";
        __int16 v8 = 2112;
        double v9 = self;
        __int16 v10 = 2048;
        unint64_t v11 = a3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Attempt to set total units on finished progress: %llu", (uint8_t *)&v6, 0x20u);
      }
    }
    else if ([(IXSCoordinatorProgress *)self totalUnitsCompleted] <= a3)
    {
      self->_totalUnits = a3;
      [(IXSCoordinatorProgress *)self _notifyDelegateAndUpdateProgressWithPhaseCompleted:0];
    }
  }
}

- (unint64_t)totalUnitsCompleted
{
  return self->_totalUnitsCompleted;
}

- (unint64_t)totalUnits
{
  return self->_totalUnits;
}

- (unint64_t)progressPhase
{
  return self->_progressPhase;
}

- (void)setProgressPhase:(unint64_t)a3
{
  self->_progressPhase = a3;
}

- (double)currentPhaseProgress
{
  return self->_currentPhaseProgress;
}

- (void)setCurrentPhaseProgress:(double)a3
{
  self->_currentPhaseProgress = a3;
}

- (BOOL)progressCompleted
{
  return self->_progressCompleted;
}

- (void)setProgressCompleted:(BOOL)a3
{
  self->_progressCompleted = a3;
}

- (BOOL)needsPostProcessing
{
  return self->_needsPostProcessing;
}

- (void)setNeedsPostProcessing:(BOOL)a3
{
  self->_needsPostProcessing = a3;
}

- (IXProgressHint)progressHint
{
  return self->_progressHint;
}

- (void)setProgressHint:(id)a3
{
}

- (IXApplicationIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (IXSCoordinatorProgressDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IXSCoordinatorProgressDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_progressHint, 0);
}

@end