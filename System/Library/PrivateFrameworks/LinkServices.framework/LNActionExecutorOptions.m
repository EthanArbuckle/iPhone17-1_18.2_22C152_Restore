@interface LNActionExecutorOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsPrepareBeforePerform;
- (BOOL)convertArrayResultToAsyncSequence;
- (BOOL)donateToTranscript;
- (BOOL)oneShotForSpringBoardOnly;
- (BOOL)preferNoticePresentation;
- (BOOL)requestUnlockIfNeeded;
- (LNActionExecutorOptions)init;
- (LNActionExecutorOptions)initWithCoder:(id)a3;
- (LNEnvironment)environment;
- (LNExportedContentConfiguration)exportedContentConfiguration;
- (LNSystemContext)systemContext;
- (NSNumber)viewActionIdentifier;
- (NSString)clientLabel;
- (NSString)sourceOverride;
- (NSUUID)executionUUID;
- (double)connectionOperationTimeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)interactionMode;
- (int64_t)kind;
- (unsigned)source;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsPrepareBeforePerform:(BOOL)a3;
- (void)setClientLabel:(id)a3;
- (void)setConnectionOperationTimeout:(double)a3;
- (void)setConvertArrayResultToAsyncSequence:(BOOL)a3;
- (void)setDonateToTranscript:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setExecutionUUID:(id)a3;
- (void)setExportedContentConfiguration:(id)a3;
- (void)setInteractionMode:(int64_t)a3;
- (void)setKind:(int64_t)a3;
- (void)setOneShotForSpringBoardOnly:(BOOL)a3;
- (void)setPreferNoticePresentation:(BOOL)a3;
- (void)setRequestUnlockIfNeeded:(BOOL)a3;
- (void)setSource:(unsigned __int16)a3;
- (void)setSourceOverride:(id)a3;
- (void)setSystemContext:(id)a3;
- (void)setViewActionIdentifier:(id)a3;
@end

@implementation LNActionExecutorOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedContentConfiguration, 0);
  objc_storeStrong((id *)&self->_systemContext, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_viewActionIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceOverride, 0);
  objc_storeStrong((id *)&self->_clientLabel, 0);
  objc_storeStrong((id *)&self->_executionUUID, 0);
}

- (void)setConvertArrayResultToAsyncSequence:(BOOL)a3
{
  self->_convertArrayResultToAsyncSequence = a3;
}

- (BOOL)convertArrayResultToAsyncSequence
{
  return self->_convertArrayResultToAsyncSequence;
}

- (void)setPreferNoticePresentation:(BOOL)a3
{
  self->_preferNoticePresentation = a3;
}

- (BOOL)preferNoticePresentation
{
  return self->_preferNoticePresentation;
}

- (void)setExportedContentConfiguration:(id)a3
{
}

- (LNExportedContentConfiguration)exportedContentConfiguration
{
  return self->_exportedContentConfiguration;
}

- (void)setConnectionOperationTimeout:(double)a3
{
  self->_connectionOperationTimeout = a3;
}

- (double)connectionOperationTimeout
{
  return self->_connectionOperationTimeout;
}

- (void)setAllowsPrepareBeforePerform:(BOOL)a3
{
  self->_allowsPrepareBeforePerform = a3;
}

- (BOOL)allowsPrepareBeforePerform
{
  return self->_allowsPrepareBeforePerform;
}

- (void)setSystemContext:(id)a3
{
}

- (LNSystemContext)systemContext
{
  return self->_systemContext;
}

- (void)setEnvironment:(id)a3
{
}

- (LNEnvironment)environment
{
  return self->_environment;
}

- (void)setRequestUnlockIfNeeded:(BOOL)a3
{
  self->_requestUnlockIfNeeded = a3;
}

- (BOOL)requestUnlockIfNeeded
{
  return self->_requestUnlockIfNeeded;
}

- (void)setDonateToTranscript:(BOOL)a3
{
  self->_donateToTranscript = a3;
}

- (BOOL)donateToTranscript
{
  return self->_donateToTranscript;
}

- (void)setViewActionIdentifier:(id)a3
{
}

- (NSNumber)viewActionIdentifier
{
  return self->_viewActionIdentifier;
}

- (void)setInteractionMode:(int64_t)a3
{
  self->_interactionMode = a3;
}

- (int64_t)interactionMode
{
  return self->_interactionMode;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setSourceOverride:(id)a3
{
}

- (NSString)sourceOverride
{
  return self->_sourceOverride;
}

- (void)setSource:(unsigned __int16)a3
{
  self->_source = a3;
}

- (unsigned)source
{
  return self->_source;
}

- (void)setClientLabel:(id)a3
{
}

- (NSString)clientLabel
{
  return self->_clientLabel;
}

- (void)setExecutionUUID:(id)a3
{
}

- (NSUUID)executionUUID
{
  return self->_executionUUID;
}

- (LNActionExecutorOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
  if (v5)
  {
    self = [(LNActionExecutorOptions *)self init];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"executionUUID"];
    [(LNActionExecutorOptions *)self setExecutionUUID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientLabel"];
    [(LNActionExecutorOptions *)self setClientLabel:v7];

    -[LNActionExecutorOptions setSource:](self, "setSource:", (unsigned __int16)[v4 decodeIntegerForKey:@"source"]);
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceOverride"];
    [(LNActionExecutorOptions *)self setSourceOverride:v8];

    -[LNActionExecutorOptions setKind:](self, "setKind:", [v4 decodeIntegerForKey:@"kind"]);
    -[LNActionExecutorOptions setInteractionMode:](self, "setInteractionMode:", [v4 decodeIntegerForKey:@"interactionMode"]);
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"viewActionIdentifier"];
    [(LNActionExecutorOptions *)self setViewActionIdentifier:v9];

    -[LNActionExecutorOptions setDonateToTranscript:](self, "setDonateToTranscript:", [v4 decodeBoolForKey:@"donateToTranscript"]);
    [(LNActionExecutorOptions *)self setEnvironment:v5];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemContext"];
    [(LNActionExecutorOptions *)self setSystemContext:v10];

    [v4 decodeDoubleForKey:@"connectionOperationTimeout"];
    [(LNActionExecutorOptions *)self setConnectionOperationTimeout:"setConnectionOperationTimeout:"];
    -[LNActionExecutorOptions setAllowsPrepareBeforePerform:](self, "setAllowsPrepareBeforePerform:", [v4 decodeBoolForKey:@"allowsPrepareBeforePerform"]);
    -[LNActionExecutorOptions setRequestUnlockIfNeeded:](self, "setRequestUnlockIfNeeded:", [v4 decodeBoolForKey:@"requestUnlockIfNeeded"]);
    -[LNActionExecutorOptions setPreferNoticePresentation:](self, "setPreferNoticePresentation:", [v4 decodeBoolForKey:@"preferNoticePresentation"]);
    -[LNActionExecutorOptions setConvertArrayResultToAsyncSequence:](self, "setConvertArrayResultToAsyncSequence:", [v4 decodeBoolForKey:@"convertArrayResultToAsyncSequence"]);
    self->_oneShotForSpringBoardOnly = [v4 decodeBoolForKey:@"oneShotForSpringBoardOnly"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exportedContentConfiguration"];
    [(LNActionExecutorOptions *)self setExportedContentConfiguration:v11];

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNActionExecutorOptions *)self executionUUID];
  [v4 encodeObject:v5 forKey:@"executionUUID"];

  v6 = [(LNActionExecutorOptions *)self clientLabel];
  [v4 encodeObject:v6 forKey:@"clientLabel"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionExecutorOptions source](self, "source"), @"source");
  v7 = [(LNActionExecutorOptions *)self sourceOverride];
  [v4 encodeObject:v7 forKey:@"sourceOverride"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionExecutorOptions kind](self, "kind"), @"kind");
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionExecutorOptions interactionMode](self, "interactionMode"), @"interactionMode");
  v8 = [(LNActionExecutorOptions *)self viewActionIdentifier];
  [v4 encodeObject:v8 forKey:@"viewActionIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionExecutorOptions donateToTranscript](self, "donateToTranscript"), @"donateToTranscript");
  v9 = [(LNActionExecutorOptions *)self environment];
  [v4 encodeObject:v9 forKey:@"environment"];

  v10 = [(LNActionExecutorOptions *)self systemContext];
  [v4 encodeObject:v10 forKey:@"systemContext"];

  [(LNActionExecutorOptions *)self connectionOperationTimeout];
  objc_msgSend(v4, "encodeDouble:forKey:", @"connectionOperationTimeout");
  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionExecutorOptions allowsPrepareBeforePerform](self, "allowsPrepareBeforePerform"), @"allowsPrepareBeforePerform");
  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionExecutorOptions requestUnlockIfNeeded](self, "requestUnlockIfNeeded"), @"requestUnlockIfNeeded");
  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionExecutorOptions preferNoticePresentation](self, "preferNoticePresentation"), @"preferNoticePresentation");
  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionExecutorOptions convertArrayResultToAsyncSequence](self, "convertArrayResultToAsyncSequence"), @"convertArrayResultToAsyncSequence");
  [v4 encodeBool:self->_oneShotForSpringBoardOnly forKey:@"oneShotForSpringBoardOnly"];
  id v11 = [(LNActionExecutorOptions *)self exportedContentConfiguration];
  [v4 encodeObject:v11 forKey:@"exportedContentConfiguration"];
}

- (id)description
{
  v31 = NSString;
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [(LNActionExecutorOptions *)self executionUUID];
  v6 = [(LNActionExecutorOptions *)self clientLabel];
  unsigned int v7 = [(LNActionExecutorOptions *)self source];
  if (v7 > 0xA) {
    v8 = @"Application";
  }
  else {
    v8 = off_1E5B38738[v7];
  }
  v9 = v8;
  v10 = [(LNActionExecutorOptions *)self sourceOverride];
  v29 = v10;
  if (!v10)
  {
    unsigned int v11 = [(LNActionExecutorOptions *)self source];
    if (v11 > 0xA) {
      v12 = @"Application";
    }
    else {
      v12 = off_1E5B38738[v11];
    }
    v10 = v12;
  }
  int64_t v13 = [(LNActionExecutorOptions *)self kind];
  v14 = @"Unknown";
  if (v13 == 1) {
    v14 = @"Custom Shortcut";
  }
  if (v13 == 2) {
    v14 = @"App Shortcut";
  }
  v28 = v14;
  int64_t v15 = [(LNActionExecutorOptions *)self interactionMode];
  v32 = (void *)v5;
  v33 = (void *)v4;
  v30 = v9;
  if ((unint64_t)(v15 - 1) > 3) {
    v16 = @"unknown";
  }
  else {
    v16 = off_1E5B38E48[v15 - 1];
  }
  v27 = v16;
  v17 = [(LNActionExecutorOptions *)self viewActionIdentifier];
  if ([(LNActionExecutorOptions *)self donateToTranscript]) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  v19 = [(LNActionExecutorOptions *)self environment];
  v20 = [(LNActionExecutorOptions *)self systemContext];
  if ([(LNActionExecutorOptions *)self allowsPrepareBeforePerform]) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  if ([(LNActionExecutorOptions *)self requestUnlockIfNeeded]) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  if ([(LNActionExecutorOptions *)self preferNoticePresentation]) {
    v23 = @"YES";
  }
  else {
    v23 = @"NO";
  }
  if ([(LNActionExecutorOptions *)self convertArrayResultToAsyncSequence]) {
    v24 = @"YES";
  }
  else {
    v24 = @"NO";
  }
  v25 = [v31 stringWithFormat:@"<%@: %p, executionUUID: %@, clientLabel: %@, source: %@, sourceOverride: %@, kind: %@, interactionMode: %@, viewActionIdentifier: %@, donateToTranscript: %@, environment: %@, systemContext: %@, allowsPrepareBeforePerform: %@, requestUnlockIfNeeded: %@, preferNoticePresentation: %@, convertArrayResultToAsyncSequence: %@>", v33, self, v32, v6, v30, v10, v28, v27, v17, v18, v19, v20, v21, v22, v23, v24];

  if (!v29) {
  return v25;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(LNActionExecutorOptions *)self executionUUID];
  [(id)v4 setExecutionUUID:v5];

  v6 = [(LNActionExecutorOptions *)self clientLabel];
  [(id)v4 setClientLabel:v6];

  objc_msgSend((id)v4, "setSource:", -[LNActionExecutorOptions source](self, "source"));
  unsigned int v7 = [(LNActionExecutorOptions *)self sourceOverride];
  [(id)v4 setSourceOverride:v7];

  objc_msgSend((id)v4, "setKind:", -[LNActionExecutorOptions kind](self, "kind"));
  objc_msgSend((id)v4, "setInteractionMode:", -[LNActionExecutorOptions interactionMode](self, "interactionMode"));
  v8 = [(LNActionExecutorOptions *)self viewActionIdentifier];
  [(id)v4 setViewActionIdentifier:v8];

  objc_msgSend((id)v4, "setDonateToTranscript:", -[LNActionExecutorOptions donateToTranscript](self, "donateToTranscript"));
  v9 = [(LNActionExecutorOptions *)self environment];
  [(id)v4 setEnvironment:v9];

  v10 = [(LNActionExecutorOptions *)self systemContext];
  [(id)v4 setSystemContext:v10];

  [(LNActionExecutorOptions *)self connectionOperationTimeout];
  objc_msgSend((id)v4, "setConnectionOperationTimeout:");
  objc_msgSend((id)v4, "setAllowsPrepareBeforePerform:", -[LNActionExecutorOptions allowsPrepareBeforePerform](self, "allowsPrepareBeforePerform"));
  objc_msgSend((id)v4, "setRequestUnlockIfNeeded:", -[LNActionExecutorOptions requestUnlockIfNeeded](self, "requestUnlockIfNeeded"));
  objc_msgSend((id)v4, "setPreferNoticePresentation:", -[LNActionExecutorOptions preferNoticePresentation](self, "preferNoticePresentation"));
  objc_msgSend((id)v4, "setConvertArrayResultToAsyncSequence:", -[LNActionExecutorOptions convertArrayResultToAsyncSequence](self, "convertArrayResultToAsyncSequence"));
  *(unsigned char *)(v4 + 8) = self->_oneShotForSpringBoardOnly;
  objc_storeStrong((id *)(v4 + 88), self->_exportedContentConfiguration);
  return (id)v4;
}

- (LNActionExecutorOptions)init
{
  v11.receiver = self;
  v11.super_class = (Class)LNActionExecutorOptions;
  v2 = [(LNActionExecutorOptions *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    *((_WORD *)v2 + 7) = 0;
    *(_OWORD *)(v2 + 40) = xmmword_1A45048A0;
    v2[9] = 1;
    uint64_t v5 = [[LNEnvironment alloc] initWithLocaleIdentifier:@"en"];
    v6 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v5;

    uint64_t v7 = objc_opt_new();
    v8 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v7;

    *((void *)v2 + 10) = LNConnectionOperationRequestTimeout;
    *((_WORD *)v2 + 6) = 0;
    v9 = v2;
  }

  return (LNActionExecutorOptions *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)oneShotForSpringBoardOnly
{
  return self->_oneShotForSpringBoardOnly;
}

- (void)setOneShotForSpringBoardOnly:(BOOL)a3
{
  self->_oneShotForSpringBoardOnly = a3;
}

@end