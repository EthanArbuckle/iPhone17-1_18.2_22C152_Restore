@interface AEAssessmentSession
+ (BOOL)supportsConfigurationUpdates;
+ (BOOL)supportsMultipleParticipants;
- (AEAssessmentConfiguration)configuration;
- (AEAssessmentSession)initWithConfiguration:(AEAssessmentConfiguration *)configuration;
- (BOOL)isActive;
- (id)delegate;
- (id)publicErrorForClientError:(id)a1;
- (uint64_t)isUnsupportedPlatformClientError:(uint64_t)a1;
- (void)assessmentSessionWrapper:(id)a3 failedToBeginWithError:(id)a4;
- (void)assessmentSessionWrapper:(id)a3 failedToUpdateToConfigurationWrapper:(id)a4 error:(id)a5;
- (void)assessmentSessionWrapper:(id)a3 wasInterruptedWithError:(id)a4;
- (void)assessmentSessionWrapperDidBegin:(id)a3;
- (void)assessmentSessionWrapperDidEnd:(id)a3;
- (void)assessmentSessionWrapperDidUpdate:(id)a3;
- (void)begin;
- (void)end;
- (void)setDelegate:(id)delegate;
- (void)updateToConfiguration:(AEAssessmentConfiguration *)configuration;
@end

@implementation AEAssessmentSession

- (AEAssessmentSession)initWithConfiguration:(AEAssessmentConfiguration *)configuration
{
  v4 = configuration;
  v11.receiver = self;
  v11.super_class = (Class)AEAssessmentSession;
  v5 = [(AEAssessmentSession *)&v11 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFC510]);
    v7 = [(AEAssessmentConfiguration *)v4 configurationWrapper];
    uint64_t v8 = [v6 initWithConfigurationWrapper:v7 queue:MEMORY[0x263EF83A0]];
    sessionWrapper = v5->_sessionWrapper;
    v5->_sessionWrapper = (AECAssessmentSessionWrapper *)v8;

    [(AECAssessmentSessionWrapper *)v5->_sessionWrapper setDelegate:v5];
  }

  return v5;
}

+ (BOOL)supportsConfigurationUpdates
{
  return [MEMORY[0x263EFC510] supportsMultiAppConfiguration];
}

+ (BOOL)supportsMultipleParticipants
{
  return [MEMORY[0x263EFC510] supportsMultiAppConfiguration];
}

- (AEAssessmentConfiguration)configuration
{
  if (self) {
    self = (AEAssessmentSession *)self->_sessionWrapper;
  }
  v2 = [(AEAssessmentSession *)self configurationWrapper];
  v3 = +[AEAssessmentConfiguration configurationFromWrapper:v2];

  return (AEAssessmentConfiguration *)v3;
}

- (BOOL)isActive
{
  if (self) {
    self = (AEAssessmentSession *)self->_sessionWrapper;
  }
  return [(AEAssessmentSession *)self isActive];
}

- (void)begin
{
  if (self) {
    self = (AEAssessmentSession *)self->_sessionWrapper;
  }
  [(AEAssessmentSession *)self begin];
}

- (void)updateToConfiguration:(AEAssessmentConfiguration *)configuration
{
  if (self) {
    sessionWrapper = self->_sessionWrapper;
  }
  else {
    sessionWrapper = 0;
  }
  v5 = sessionWrapper;
  id v6 = [(AEAssessmentConfiguration *)configuration configurationWrapper];
  [(AECAssessmentSessionWrapper *)v5 updateToConfigurationWrapper:v6];
}

- (void)end
{
  if (self) {
    self = (AEAssessmentSession *)self->_sessionWrapper;
  }
  [(AEAssessmentSession *)self end];
}

- (void)assessmentSessionWrapperDidBegin:(id)a3
{
  v4 = [(AEAssessmentSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AEAssessmentSession *)self delegate];
    [v6 assessmentSessionDidBegin:self];
  }
}

- (void)assessmentSessionWrapperDidEnd:(id)a3
{
  v4 = [(AEAssessmentSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AEAssessmentSession *)self delegate];
    [v6 assessmentSessionDidEnd:self];
  }
}

- (void)assessmentSessionWrapper:(id)a3 failedToBeginWithError:(id)a4
{
  id v9 = a4;
  char v5 = [(AEAssessmentSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = -[AEAssessmentSession publicErrorForClientError:](self, v9);
    uint64_t v8 = [(AEAssessmentSession *)self delegate];
    [v8 assessmentSession:self failedToBeginWithError:v7];
  }
}

- (id)publicErrorForClientError:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    if (-[AEAssessmentSession isUnsupportedPlatformClientError:]((uint64_t)v2, v3)) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    AEErrorUnderlyingError(v4, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

- (void)assessmentSessionWrapper:(id)a3 wasInterruptedWithError:(id)a4
{
  id v9 = a4;
  char v5 = [(AEAssessmentSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = -[AEAssessmentSession publicErrorForClientError:](self, v9);
    uint64_t v8 = [(AEAssessmentSession *)self delegate];
    [v8 assessmentSession:self wasInterruptedWithError:v7];
  }
}

- (void)assessmentSessionWrapperDidUpdate:(id)a3
{
  uint64_t v4 = [(AEAssessmentSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AEAssessmentSession *)self delegate];
    [v6 assessmentSessionDidUpdate:self];
  }
}

- (void)assessmentSessionWrapper:(id)a3 failedToUpdateToConfigurationWrapper:(id)a4 error:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  uint64_t v8 = [(AEAssessmentSession *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = -[AEAssessmentSession publicErrorForClientError:](self, v7);
    objc_super v11 = +[AEAssessmentConfiguration configurationFromWrapper:v13];
    v12 = [(AEAssessmentSession *)self delegate];
    [v12 assessmentSession:self failedToUpdateToConfiguration:v11 error:v10];
  }
}

- (uint64_t)isUnsupportedPlatformClientError:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!a1)
  {
    uint64_t v20 = 0;
    goto LABEL_22;
  }
  char v5 = [v3 userInfo];
  id v6 = (void *)MEMORY[0x263F20430];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F20430]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v4 userInfo];
    char v9 = [v8 objectForKeyedSubscript:*v6];
  }
  else
  {
    char v9 = 0;
  }

  id v10 = [v4 domain];
  if ([v10 isEqualToString:*MEMORY[0x263F20428]] && objc_msgSend(v4, "code") == 100)
  {

    if (!v9) {
      goto LABEL_20;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "domain", (void)v21);
          v17 = [MEMORY[0x263EFC518] domain];
          if ([v16 isEqualToString:v17])
          {
            uint64_t v18 = [v15 code];

            if (v18 == 2)
            {

              uint64_t v20 = 1;
              goto LABEL_21;
            }
          }
          else
          {
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }
  }

LABEL_20:
  uint64_t v20 = 0;
LABEL_21:

LABEL_22:
  return v20;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionWrapper, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end