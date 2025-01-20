@interface msdosProgressHelper
- (NSProgress)childProgress;
- (NSProgress)parentProgress;
- (id)startPhase:(id)a3 parentUnitCount:(int64_t)a4 phaseTotalCount:(int64_t)a5 completedCounter:(const unsigned int *)a6;
- (msdosProgressHelper)initWithProgress:(id)a3;
- (void)endPhase:(id)a3;
- (void)setChildProgress:(id)a3;
- (void)setParentProgress:(id)a3;
@end

@implementation msdosProgressHelper

- (msdosProgressHelper)initWithProgress:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)msdosProgressHelper;
  v6 = [(msdosProgressHelper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parentProgress, a3);
    childProgress = v7->_childProgress;
    v7->_childProgress = 0;
  }
  return v7;
}

- (id)startPhase:(id)a3 parentUnitCount:(int64_t)a4 phaseTotalCount:(int64_t)a5 completedCounter:(const unsigned int *)a6
{
  if (self->_childProgress)
  {
    v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100031AD8((uint64_t)self, v7);
    }

    v8 = fs_errorForPOSIXError();
  }
  else
  {
    -[NSProgress setLocalizedDescription:](self->_parentProgress, "setLocalizedDescription:", a3, a4, a5, a6);
    v11 = +[NSProgress progressWithTotalUnitCount:a5];
    childProgress = self->_childProgress;
    self->_childProgress = v11;

    [(NSProgress *)self->_parentProgress addChild:self->_childProgress withPendingUnitCount:a4];
    v8 = 0;
  }

  return v8;
}

- (void)endPhase:(id)a3
{
  if (self->_childProgress)
  {
    [(NSProgress *)self->_parentProgress setLocalizedDescription:a3];
    [(NSProgress *)self->_childProgress setCompletedUnitCount:[(NSProgress *)self->_childProgress totalUnitCount]];
    childProgress = self->_childProgress;
    self->_childProgress = 0;
  }
}

- (NSProgress)parentProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParentProgress:(id)a3
{
}

- (NSProgress)childProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 16, 1);
}

- (void)setChildProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childProgress, 0);

  objc_storeStrong((id *)&self->_parentProgress, 0);
}

@end