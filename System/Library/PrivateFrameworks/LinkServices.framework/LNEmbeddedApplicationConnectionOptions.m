@interface LNEmbeddedApplicationConnectionOptions
- (BOOL)activateSuspended;
- (BOOL)allowsForegroundAppLaunchWhileInCarPlay;
- (BOOL)isCameraCaptureAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForeground;
- (BOOL)sceneless;
- (LNAction)oneShotActionForSpringBoardOnly;
- (LNActionExecutorOptions)oneShotActionExecutorOptionsForSpringBoardOnly;
- (LNEmbeddedApplicationConnectionOptions)init;
- (NSString)actionSourceOverride;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newConnectionAction;
- (int64_t)openApplicationPriority;
- (unint64_t)hash;
- (unsigned)actionSource;
- (void)setActionSource:(unsigned __int16)a3;
- (void)setActionSourceOverride:(id)a3;
- (void)setAllowsForegroundAppLaunchWhileInCarPlay:(BOOL)a3;
- (void)setIsCameraCaptureAction:(BOOL)a3;
- (void)setOneShotActionExecutorOptionsForSpringBoardOnly:(id)a3;
- (void)setOneShotActionForSpringBoardOnly:(id)a3;
- (void)setOpenApplicationPriority:(int64_t)a3;
- (void)setSceneless:(BOOL)a3;
@end

@implementation LNEmbeddedApplicationConnectionOptions

- (LNEmbeddedApplicationConnectionOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)LNEmbeddedApplicationConnectionOptions;
  v2 = [(LNEmbeddedApplicationConnectionOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_sceneless = 1;
    v2->_openApplicationPriority = 1;
    v2->_allowsForegroundAppLaunchWhileInCarPlay = 1;
    v2->_actionSource = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSourceOverride, 0);
  objc_storeStrong((id *)&self->_oneShotActionExecutorOptionsForSpringBoardOnly, 0);
  objc_storeStrong((id *)&self->_oneShotActionForSpringBoardOnly, 0);
}

- (id)newConnectionAction
{
  v3 = [(LNEmbeddedApplicationConnectionOptions *)self oneShotActionForSpringBoardOnly];

  if (v3)
  {
    v4 = [LNOneShotConnectionAction alloc];
    v5 = [MEMORY[0x1E4F29128] UUID];
    objc_super v6 = [(LNEmbeddedApplicationConnectionOptions *)self oneShotActionForSpringBoardOnly];
    v7 = [(LNEmbeddedApplicationConnectionOptions *)self oneShotActionExecutorOptionsForSpringBoardOnly];
    v8 = [(LNOneShotConnectionAction *)v4 initWithIdentifier:v5 action:v6 executorOptions:v7];

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)LNEmbeddedApplicationConnectionOptions;
    return [(LNConnectionOptions *)&v10 newConnectionAction];
  }
}

- (NSString)description
{
  v26 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int64_t v5 = [(LNConnectionOptions *)self authenticationPolicy];
  objc_super v6 = @"Force Unlock";
  if (!v5) {
    objc_super v6 = @"Default";
  }
  v7 = v6;
  BOOL v8 = [(LNEmbeddedApplicationConnectionOptions *)self sceneless];
  BOOL v9 = [(LNEmbeddedApplicationConnectionOptions *)self activateSuspended];
  int64_t v10 = [(LNEmbeddedApplicationConnectionOptions *)self openApplicationPriority];
  if ((unint64_t)(v10 - 1) > 2) {
    v11 = @"None";
  }
  else {
    v11 = off_1E5B388A8[v10 - 1];
  }
  v12 = v11;
  BOOL v13 = [(LNEmbeddedApplicationConnectionOptions *)self allowsForegroundAppLaunchWhileInCarPlay];
  BOOL v14 = [(LNConnectionOptions *)self initiatesAudioSession];
  BOOL v15 = [(LNEmbeddedApplicationConnectionOptions *)self isCameraCaptureAction];
  unsigned int v16 = [(LNEmbeddedApplicationConnectionOptions *)self actionSource];
  if (v16 > 0xA) {
    v17 = @"Application";
  }
  else {
    v17 = off_1E5B38738[v16];
  }
  if (v15) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  if (v14) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  if (v13) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  if (v9) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  if (v8) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  v23 = v17;
  v24 = [v26 stringWithFormat:@"<%@: %p, authenticationPolicy: %@, sceneless: %@, activateSuspended: %@, openApplicationPriority: %@, allowsForegroundAppLaunchWhileInCarPlay: %@, initiatesAudioSession: %@, isCameraCapture:%@, actionSource: %@>", v4, self, v7, v22, v21, v12, v20, v19, v18, v23];

  return (NSString *)v24;
}

- (BOOL)allowsForegroundAppLaunchWhileInCarPlay
{
  return self->_allowsForegroundAppLaunchWhileInCarPlay;
}

- (unsigned)actionSource
{
  return self->_actionSource;
}

- (BOOL)sceneless
{
  return self->_sceneless;
}

- (int64_t)openApplicationPriority
{
  return self->_openApplicationPriority;
}

- (BOOL)activateSuspended
{
  v3 = [(LNEmbeddedApplicationConnectionOptions *)self oneShotActionForSpringBoardOnly];

  if (v3) {
    return [(LNEmbeddedApplicationConnectionOptions *)self openApplicationPriority] != 2;
  }
  else {
    return ![(LNEmbeddedApplicationConnectionOptions *)self isCameraCaptureAction];
  }
}

- (BOOL)isCameraCaptureAction
{
  return self->_isCameraCaptureAction;
}

- (LNAction)oneShotActionForSpringBoardOnly
{
  return self->_oneShotActionForSpringBoardOnly;
}

- (NSString)actionSourceOverride
{
  return self->_actionSourceOverride;
}

- (void)setIsCameraCaptureAction:(BOOL)a3
{
  self->_isCameraCaptureAction = a3;
}

- (void)setActionSourceOverride:(id)a3
{
}

- (void)setActionSource:(unsigned __int16)a3
{
  self->_actionSource = a3;
}

- (void)setAllowsForegroundAppLaunchWhileInCarPlay:(BOOL)a3
{
  self->_allowsForegroundAppLaunchWhileInCarPlay = a3;
}

- (void)setOpenApplicationPriority:(int64_t)a3
{
  self->_openApplicationPriority = a3;
}

- (void)setSceneless:(BOOL)a3
{
  self->_sceneless = a3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNEmbeddedApplicationConnectionOptions *)a3;
  int64_t v5 = v4;
  if (self == v4)
  {
    char v17 = 1;
    goto LABEL_18;
  }
  objc_super v6 = v4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v19.receiver = self;
    v19.super_class = (Class)LNEmbeddedApplicationConnectionOptions;
    if ([(LNConnectionOptions *)&v19 isEqual:v6])
    {
      BOOL v7 = [(LNEmbeddedApplicationConnectionOptions *)self sceneless];
      if (v7 == [(LNEmbeddedApplicationConnectionOptions *)v6 sceneless])
      {
        int64_t v8 = [(LNEmbeddedApplicationConnectionOptions *)self openApplicationPriority];
        if (v8 == [(LNEmbeddedApplicationConnectionOptions *)v6 openApplicationPriority])
        {
          BOOL v9 = [(LNEmbeddedApplicationConnectionOptions *)self allowsForegroundAppLaunchWhileInCarPlay];
          if (v9 == [(LNEmbeddedApplicationConnectionOptions *)v6 allowsForegroundAppLaunchWhileInCarPlay])
          {
            int v10 = [(LNEmbeddedApplicationConnectionOptions *)self actionSource];
            if (v10 == [(LNEmbeddedApplicationConnectionOptions *)v6 actionSource])
            {
              BOOL v11 = [(LNEmbeddedApplicationConnectionOptions *)self isCameraCaptureAction];
              if (v11 == [(LNEmbeddedApplicationConnectionOptions *)v6 isCameraCaptureAction])
              {
                v12 = [(LNEmbeddedApplicationConnectionOptions *)self oneShotActionForSpringBoardOnly];
                BOOL v13 = [(LNEmbeddedApplicationConnectionOptions *)v6 oneShotActionForSpringBoardOnly];
                id v14 = v12;
                id v15 = v13;
                unsigned int v16 = v15;
                if (v14 == v15)
                {
                  char v17 = 1;
                }
                else
                {
                  char v17 = 0;
                  if (v14 && v15) {
                    char v17 = [v14 isEqual:v15];
                  }
                }

                goto LABEL_16;
              }
            }
          }
        }
      }
    }
  }
  else
  {

    objc_super v6 = 0;
  }
  char v17 = 0;
LABEL_16:

LABEL_18:
  return v17;
}

- (unint64_t)hash
{
  uint64_t v3 = [(LNEmbeddedApplicationConnectionOptions *)self sceneless];
  int64_t v4 = [(LNEmbeddedApplicationConnectionOptions *)self openApplicationPriority] ^ v3;
  uint64_t v5 = [(LNEmbeddedApplicationConnectionOptions *)self allowsForegroundAppLaunchWhileInCarPlay];
  int64_t v6 = v4 ^ v5 ^ [(LNEmbeddedApplicationConnectionOptions *)self actionSource];
  uint64_t v7 = [(LNEmbeddedApplicationConnectionOptions *)self isCameraCaptureAction];
  int64_t v8 = [(LNEmbeddedApplicationConnectionOptions *)self oneShotActionForSpringBoardOnly];
  unint64_t v9 = v6 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isForeground
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LNEmbeddedApplicationConnectionOptions;
  id v4 = [(LNConnectionOptions *)&v8 copyWithZone:a3];
  objc_msgSend(v4, "setSceneless:", -[LNEmbeddedApplicationConnectionOptions sceneless](self, "sceneless"));
  objc_msgSend(v4, "setOpenApplicationPriority:", -[LNEmbeddedApplicationConnectionOptions openApplicationPriority](self, "openApplicationPriority"));
  objc_msgSend(v4, "setAllowsForegroundAppLaunchWhileInCarPlay:", -[LNEmbeddedApplicationConnectionOptions allowsForegroundAppLaunchWhileInCarPlay](self, "allowsForegroundAppLaunchWhileInCarPlay"));
  objc_msgSend(v4, "setActionSource:", -[LNEmbeddedApplicationConnectionOptions actionSource](self, "actionSource"));
  objc_msgSend(v4, "setIsCameraCaptureAction:", -[LNEmbeddedApplicationConnectionOptions isCameraCaptureAction](self, "isCameraCaptureAction"));
  uint64_t v5 = [(LNEmbeddedApplicationConnectionOptions *)self oneShotActionForSpringBoardOnly];
  [v4 setOneShotActionForSpringBoardOnly:v5];

  int64_t v6 = [(LNEmbeddedApplicationConnectionOptions *)self oneShotActionExecutorOptionsForSpringBoardOnly];
  [v4 setOneShotActionExecutorOptionsForSpringBoardOnly:v6];

  return v4;
}

- (LNActionExecutorOptions)oneShotActionExecutorOptionsForSpringBoardOnly
{
  return self->_oneShotActionExecutorOptionsForSpringBoardOnly;
}

- (void)setOneShotActionExecutorOptionsForSpringBoardOnly:(id)a3
{
}

- (void)setOneShotActionForSpringBoardOnly:(id)a3
{
}

@end