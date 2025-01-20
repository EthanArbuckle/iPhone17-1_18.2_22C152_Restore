@interface _LTSELFLoggingEventData
+ (BOOL)supportsSecureCoding;
- (NSError)invocationEndedError;
- (NSString)invocationCancelledReason;
- (NSString)translationPayload;
- (NSString)trustedClientIdentifier;
- (NSString)untrustedClientIdentifier;
- (NSUUID)invocationId;
- (NSUUID)qssSessionId;
- (_LTLocalePair)translationLocalePair;
- (_LTSELFLoggingEventData)initWithCoder:(id)a3;
- (_LTSELFLoggingEventData)initWithType:(int64_t)a3 invocationId:(id)a4;
- (_LTSELFLoggingInvocationOptions)startInvocationOptions;
- (_LTSELFLoggingTranslationLIDData)translationLIDData;
- (_LTSELFLoggingTranslationTTSData)translationTTSData;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setInvocationCancelledReason:(id)a3;
- (void)setInvocationEndedError:(id)a3;
- (void)setQssSessionId:(id)a3;
- (void)setStartInvocationOptions:(id)a3;
- (void)setTranslationLIDData:(id)a3;
- (void)setTranslationLocalePair:(id)a3;
- (void)setTranslationPayload:(id)a3;
- (void)setTranslationTTSData:(id)a3;
- (void)setTrustedClientIdentifier:(id)a3;
- (void)setUntrustedClientIdentifier:(id)a3;
@end

@implementation _LTSELFLoggingEventData

- (_LTSELFLoggingEventData)initWithType:(int64_t)a3 invocationId:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_LTSELFLoggingEventData;
  v8 = [(_LTSELFLoggingEventData *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_invocationId, a4);
    v10 = v9;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_invocationId forKey:@"invocationId"];
  [v5 encodeObject:self->_startInvocationOptions forKey:@"startInvocationOptions"];
  [v5 encodeObject:self->_qssSessionId forKey:@"qssSessionId"];
  [v5 encodeObject:self->_invocationEndedError forKey:@"invocationEndedError"];
  [v5 encodeObject:self->_invocationCancelledReason forKey:@"invocationCancelledReason"];
  [v5 encodeObject:self->_translationPayload forKey:@"translationPayload"];
  [v5 encodeObject:self->_translationLocalePair forKey:@"translationLocalePair"];
  [v5 encodeObject:self->_translationTTSData forKey:@"translationTTSData"];
  [v5 encodeObject:self->_translationLIDData forKey:@"translationLIDData"];
  [v5 encodeObject:self->_untrustedClientIdentifier forKey:@"untrustedClientIdentifier"];
}

- (_LTSELFLoggingEventData)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_LTSELFLoggingEventData;
  id v5 = [(_LTSELFLoggingEventData *)&v28 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invocationId"];
    invocationId = v5->_invocationId;
    v5->_invocationId = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startInvocationOptions"];
    startInvocationOptions = v5->_startInvocationOptions;
    v5->_startInvocationOptions = (_LTSELFLoggingInvocationOptions *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"qssSessionId"];
    qssSessionId = v5->_qssSessionId;
    v5->_qssSessionId = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invocationEndedError"];
    invocationEndedError = v5->_invocationEndedError;
    v5->_invocationEndedError = (NSError *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invocationCancelledReason"];
    invocationCancelledReason = v5->_invocationCancelledReason;
    v5->_invocationCancelledReason = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"translationPayload"];
    translationPayload = v5->_translationPayload;
    v5->_translationPayload = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"translationLocalePair"];
    translationLocalePair = v5->_translationLocalePair;
    v5->_translationLocalePair = (_LTLocalePair *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"translationTTSData"];
    translationTTSData = v5->_translationTTSData;
    v5->_translationTTSData = (_LTSELFLoggingTranslationTTSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"translationLIDData"];
    translationLIDData = v5->_translationLIDData;
    v5->_translationLIDData = (_LTSELFLoggingTranslationLIDData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"untrustedClientIdentifier"];
    untrustedClientIdentifier = v5->_untrustedClientIdentifier;
    v5->_untrustedClientIdentifier = (NSString *)v24;

    v26 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_LTSELFLoggingEventData alloc];
  int64_t v5 = [(_LTSELFLoggingEventData *)self type];
  uint64_t v6 = [(_LTSELFLoggingEventData *)self invocationId];
  id v7 = [(_LTSELFLoggingEventData *)v4 initWithType:v5 invocationId:v6];

  uint64_t v8 = [(_LTSELFLoggingEventData *)self startInvocationOptions];
  [(_LTSELFLoggingEventData *)v7 setStartInvocationOptions:v8];

  v9 = [(_LTSELFLoggingEventData *)self qssSessionId];
  [(_LTSELFLoggingEventData *)v7 setQssSessionId:v9];

  uint64_t v10 = [(_LTSELFLoggingEventData *)self invocationEndedError];
  [(_LTSELFLoggingEventData *)v7 setInvocationEndedError:v10];

  v11 = [(_LTSELFLoggingEventData *)self invocationCancelledReason];
  [(_LTSELFLoggingEventData *)v7 setInvocationCancelledReason:v11];

  uint64_t v12 = [(_LTSELFLoggingEventData *)self translationPayload];
  [(_LTSELFLoggingEventData *)v7 setTranslationPayload:v12];

  v13 = [(_LTSELFLoggingEventData *)self translationLocalePair];
  [(_LTSELFLoggingEventData *)v7 setTranslationLocalePair:v13];

  uint64_t v14 = [(_LTSELFLoggingEventData *)self translationTTSData];
  v15 = (void *)[v14 copy];
  [(_LTSELFLoggingEventData *)v7 setTranslationTTSData:v15];

  uint64_t v16 = [(_LTSELFLoggingEventData *)self untrustedClientIdentifier];
  [(_LTSELFLoggingEventData *)v7 setUntrustedClientIdentifier:v16];

  v17 = [(_LTSELFLoggingEventData *)self trustedClientIdentifier];
  [(_LTSELFLoggingEventData *)v7 setTrustedClientIdentifier:v17];

  uint64_t v18 = [(_LTSELFLoggingEventData *)self translationLIDData];
  v19 = (void *)[v18 copy];
  [(_LTSELFLoggingEventData *)v7 setTranslationLIDData:v19];

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)invocationId
{
  return self->_invocationId;
}

- (_LTSELFLoggingInvocationOptions)startInvocationOptions
{
  return self->_startInvocationOptions;
}

- (void)setStartInvocationOptions:(id)a3
{
}

- (NSUUID)qssSessionId
{
  return self->_qssSessionId;
}

- (void)setQssSessionId:(id)a3
{
}

- (NSError)invocationEndedError
{
  return self->_invocationEndedError;
}

- (void)setInvocationEndedError:(id)a3
{
}

- (NSString)invocationCancelledReason
{
  return self->_invocationCancelledReason;
}

- (void)setInvocationCancelledReason:(id)a3
{
}

- (NSString)translationPayload
{
  return self->_translationPayload;
}

- (void)setTranslationPayload:(id)a3
{
}

- (_LTLocalePair)translationLocalePair
{
  return self->_translationLocalePair;
}

- (void)setTranslationLocalePair:(id)a3
{
}

- (_LTSELFLoggingTranslationTTSData)translationTTSData
{
  return self->_translationTTSData;
}

- (void)setTranslationTTSData:(id)a3
{
}

- (_LTSELFLoggingTranslationLIDData)translationLIDData
{
  return self->_translationLIDData;
}

- (void)setTranslationLIDData:(id)a3
{
}

- (NSString)untrustedClientIdentifier
{
  return self->_untrustedClientIdentifier;
}

- (void)setUntrustedClientIdentifier:(id)a3
{
}

- (NSString)trustedClientIdentifier
{
  return self->_trustedClientIdentifier;
}

- (void)setTrustedClientIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedClientIdentifier, 0);
  objc_storeStrong((id *)&self->_untrustedClientIdentifier, 0);
  objc_storeStrong((id *)&self->_translationLIDData, 0);
  objc_storeStrong((id *)&self->_translationTTSData, 0);
  objc_storeStrong((id *)&self->_translationLocalePair, 0);
  objc_storeStrong((id *)&self->_translationPayload, 0);
  objc_storeStrong((id *)&self->_invocationCancelledReason, 0);
  objc_storeStrong((id *)&self->_invocationEndedError, 0);
  objc_storeStrong((id *)&self->_qssSessionId, 0);
  objc_storeStrong((id *)&self->_startInvocationOptions, 0);

  objc_storeStrong((id *)&self->_invocationId, 0);
}

@end