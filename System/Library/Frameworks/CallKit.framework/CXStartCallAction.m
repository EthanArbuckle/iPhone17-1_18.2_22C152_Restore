@interface CXStartCallAction
+ (BOOL)supportsSecureCoding;
+ (double)timeout;
- (BOOL)isEmergency;
- (BOOL)isRelay;
- (BOOL)isRetry;
- (BOOL)isUpgrade;
- (BOOL)isVideo;
- (BOOL)isVoicemail;
- (BOOL)shouldSuppressInCallUI;
- (BOOL)shouldTimeout;
- (CGSize)localLandscapeAspectRatio;
- (CGSize)localPortraitAspectRatio;
- (CXHandle)handle;
- (CXStartCallAction)initWithCallUUID:(NSUUID *)callUUID handle:(CXHandle *)handle;
- (CXStartCallAction)initWithCallUUID:(id)a3 handles:(id)a4;
- (CXStartCallAction)initWithCoder:(NSCoder *)aDecoder;
- (NSArray)handles;
- (NSDate)dateStarted;
- (NSString)contactIdentifier;
- (NSUUID)localSenderIdentityUUID;
- (id)customDescription;
- (int64_t)ttyType;
- (void)encodeWithCoder:(id)a3;
- (void)fulfill;
- (void)fulfillWithDateStarted:(NSDate *)dateStarted;
- (void)setContactIdentifier:(NSString *)contactIdentifier;
- (void)setDateStarted:(id)a3;
- (void)setEmergency:(BOOL)a3;
- (void)setHandle:(CXHandle *)handle;
- (void)setHandles:(id)a3;
- (void)setLocalLandscapeAspectRatio:(CGSize)a3;
- (void)setLocalPortraitAspectRatio:(CGSize)a3;
- (void)setLocalSenderIdentityUUID:(id)a3;
- (void)setRelay:(BOOL)a3;
- (void)setRetry:(BOOL)a3;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setTTYType:(int64_t)a3;
- (void)setUpgrade:(BOOL)a3;
- (void)setVideo:(BOOL)video;
- (void)setVoicemail:(BOOL)a3;
- (void)updateAsFulfilledWithDateStarted:(id)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXStartCallAction

- (CXStartCallAction)initWithCallUUID:(NSUUID *)callUUID handle:(CXHandle *)handle
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v6 = handle;
  v11.receiver = self;
  v11.super_class = (Class)CXStartCallAction;
  v7 = [(CXCallAction *)&v11 initWithCallUUID:callUUID];
  if (v7)
  {
    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXStartCallAction initWithCallUUID:handle:]", @"handle" format];
    }
    v12[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    handles = v7->_handles;
    v7->_handles = (NSArray *)v8;
  }
  return v7;
}

- (CXStartCallAction)initWithCallUUID:(id)a3 handles:(id)a4
{
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CXStartCallAction;
  uint64_t v8 = [(CXCallAction *)&v10 initWithCallUUID:a3];
  if (v8)
  {
    if (![v7 count]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: array '%@' cannot be empty", "-[CXStartCallAction initWithCallUUID:handles:]", @"handles" format];
    }
    objc_storeStrong((id *)&v8->_handles, a4);
  }

  return v8;
}

- (CXHandle)handle
{
  v2 = [(CXStartCallAction *)self handles];
  v3 = [v2 firstObject];

  return (CXHandle *)v3;
}

- (void)setHandle:(CXHandle *)handle
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = handle;
  v4 = (void *)MEMORY[0x1E4F1C978];
  v5 = handle;
  v6 = [v4 arrayWithObjects:&v7 count:1];

  -[CXStartCallAction setHandles:](self, "setHandles:", v6, v7, v8);
}

- (id)customDescription
{
  v11.receiver = self;
  v11.super_class = (Class)CXStartCallAction;
  v3 = [(CXCallAction *)&v11 customDescription];
  v4 = [(CXStartCallAction *)self handles];
  [v3 appendFormat:@" handles=%@", v4];

  v5 = [(CXStartCallAction *)self contactIdentifier];
  [v3 appendFormat:@" contactIdentifier=%@", v5];

  objc_msgSend(v3, "appendFormat:", @" video=%d", -[CXStartCallAction isVideo](self, "isVideo"));
  objc_msgSend(v3, "appendFormat:", @" relay=%d", -[CXStartCallAction isRelay](self, "isRelay"));
  objc_msgSend(v3, "appendFormat:", @" upgrade=%d", -[CXStartCallAction isUpgrade](self, "isUpgrade"));
  objc_msgSend(v3, "appendFormat:", @" retry=%d", -[CXStartCallAction isRetry](self, "isRetry"));
  objc_msgSend(v3, "appendFormat:", @" emergency=%d", -[CXStartCallAction isEmergency](self, "isEmergency"));
  objc_msgSend(v3, "appendFormat:", @" isVoicemail=%d", -[CXStartCallAction isVoicemail](self, "isVoicemail"));
  objc_msgSend(v3, "appendFormat:", @" ttyType=%ld", -[CXStartCallAction ttyType](self, "ttyType"));
  [(CXStartCallAction *)self localLandscapeAspectRatio];
  v6 = NSStringFromSize(v13);
  [v3 appendFormat:@" localLandscapeAspectRatio=%@", v6];

  [(CXStartCallAction *)self localPortraitAspectRatio];
  id v7 = NSStringFromSize(v14);
  [v3 appendFormat:@" localPortraitAspectRatio=%@", v7];

  uint64_t v8 = [(CXStartCallAction *)self dateStarted];
  [v3 appendFormat:@" dateStarted=%@", v8];

  v9 = [(CXStartCallAction *)self localSenderIdentityUUID];
  [v3 appendFormat:@" localSenderIdentityUUID=%@", v9];

  objc_msgSend(v3, "appendFormat:", @" shouldSuppressInCallUI=%d", -[CXStartCallAction shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));

  return v3;
}

+ (double)timeout
{
  return 600.0;
}

- (void)fulfill
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(CXStartCallAction *)self fulfillWithDateStarted:v3];
}

- (void)fulfillWithDateStarted:(NSDate *)dateStarted
{
  v6 = dateStarted;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXStartCallAction fulfillWithDateStarted:]", @"dateStarted" format];
  }
  v4 = (void *)[(CXStartCallAction *)self copy];
  [v4 updateAsFulfilledWithDateStarted:v6];
  v5 = [v4 delegate];
  [v5 actionCompleted:v4];
}

- (BOOL)shouldTimeout
{
  return ![(CXStartCallAction *)self isEmergency];
}

- (void)updateAsFulfilledWithDateStarted:(id)a3
{
  id v4 = a3;
  [(CXAction *)self updateAsFulfilled];
  [(CXStartCallAction *)self setDateStarted:v4];
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CXStartCallAction;
  id v6 = a3;
  [(CXCallAction *)&v10 updateSanitizedCopy:v6 withZone:a4];
  id v7 = [(CXStartCallAction *)self dateStarted];
  [v6 setDateStarted:v7];

  uint64_t v8 = [(CXStartCallAction *)self handles];
  [v6 setHandles:v8];

  v9 = [(CXStartCallAction *)self contactIdentifier];
  [v6 setContactIdentifier:v9];

  objc_msgSend(v6, "setVideo:", -[CXStartCallAction isVideo](self, "isVideo"));
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CXStartCallAction;
  id v6 = a3;
  [(CXAction *)&v9 updateCopy:v6 withZone:a4];
  objc_msgSend(v6, "setRelay:", -[CXStartCallAction isRelay](self, "isRelay", v9.receiver, v9.super_class));
  objc_msgSend(v6, "setUpgrade:", -[CXStartCallAction isUpgrade](self, "isUpgrade"));
  objc_msgSend(v6, "setEmergency:", -[CXStartCallAction isEmergency](self, "isEmergency"));
  objc_msgSend(v6, "setVoicemail:", -[CXStartCallAction isVoicemail](self, "isVoicemail"));
  objc_msgSend(v6, "setTTYType:", -[CXStartCallAction ttyType](self, "ttyType"));
  id v7 = [(CXStartCallAction *)self localSenderIdentityUUID];
  [v6 setLocalSenderIdentityUUID:v7];

  objc_msgSend(v6, "setShouldSuppressInCallUI:", -[CXStartCallAction shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  [(CXStartCallAction *)self localLandscapeAspectRatio];
  objc_msgSend(v6, "setLocalLandscapeAspectRatio:");
  [(CXStartCallAction *)self localPortraitAspectRatio];
  objc_msgSend(v6, "setLocalPortraitAspectRatio:");
  uint64_t v8 = [(CXStartCallAction *)self handles];
  [v6 setHandles:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXStartCallAction)initWithCoder:(NSCoder *)aDecoder
{
  id v4 = aDecoder;
  v37.receiver = self;
  v37.super_class = (Class)CXStartCallAction;
  v5 = [(CXCallAction *)&v37 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_handles);
    uint64_t v8 = [(NSCoder *)v4 decodeArrayOfObjectsOfClass:v6 forKey:v7];
    handles = v5->_handles;
    v5->_handles = (NSArray *)v8;

    uint64_t v10 = objc_opt_class();
    objc_super v11 = NSStringFromSelector(sel_contactIdentifier);
    uint64_t v12 = [(NSCoder *)v4 decodeObjectOfClass:v10 forKey:v11];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v12;

    NSSize v14 = NSStringFromSelector(sel_isVideo);
    v5->_video = [(NSCoder *)v4 decodeBoolForKey:v14];

    v15 = NSStringFromSelector(sel_isRelay);
    v5->_relay = [(NSCoder *)v4 decodeBoolForKey:v15];

    v16 = NSStringFromSelector(sel_isUpgrade);
    v5->_upgrade = [(NSCoder *)v4 decodeBoolForKey:v16];

    v17 = NSStringFromSelector(sel_isRetry);
    v5->_retry = [(NSCoder *)v4 decodeBoolForKey:v17];

    v18 = NSStringFromSelector(sel_isEmergency);
    v5->_emergency = [(NSCoder *)v4 decodeBoolForKey:v18];

    v19 = NSStringFromSelector(sel_isVoicemail);
    v5->_voicemail = [(NSCoder *)v4 decodeBoolForKey:v19];

    v20 = NSStringFromSelector(sel_ttyType);
    v5->_ttyType = [(NSCoder *)v4 decodeIntegerForKey:v20];

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector(sel_localSenderIdentityUUID);
    uint64_t v23 = [(NSCoder *)v4 decodeObjectOfClass:v21 forKey:v22];
    localSenderIdentityUUID = v5->_localSenderIdentityUUID;
    v5->_localSenderIdentityUUID = (NSUUID *)v23;

    v25 = NSStringFromSelector(sel_shouldSuppressInCallUI);
    v5->_shouldSuppressInCallUI = [(NSCoder *)v4 decodeBoolForKey:v25];

    v26 = NSStringFromSelector(sel_localLandscapeAspectRatio);
    [(NSCoder *)v4 decodeSizeForKey:v26];
    v5->_localLandscapeAspectRatio.width = v27;
    v5->_localLandscapeAspectRatio.height = v28;

    v29 = NSStringFromSelector(sel_localPortraitAspectRatio);
    [(NSCoder *)v4 decodeSizeForKey:v29];
    v5->_localPortraitAspectRatio.width = v30;
    v5->_localPortraitAspectRatio.height = v31;

    uint64_t v32 = objc_opt_class();
    v33 = NSStringFromSelector(sel_dateStarted);
    uint64_t v34 = [(NSCoder *)v4 decodeObjectOfClass:v32 forKey:v33];
    dateStarted = v5->_dateStarted;
    v5->_dateStarted = (NSDate *)v34;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v39.receiver = self;
  v39.super_class = (Class)CXStartCallAction;
  id v4 = a3;
  [(CXCallAction *)&v39 encodeWithCoder:v4];
  v5 = [(CXStartCallAction *)self handles];
  uint64_t v6 = NSStringFromSelector(sel_handles);
  [v4 encodeObject:v5 forKey:v6];

  id v7 = [(CXStartCallAction *)self contactIdentifier];
  uint64_t v8 = NSStringFromSelector(sel_contactIdentifier);
  [v4 encodeObject:v7 forKey:v8];

  BOOL v9 = [(CXStartCallAction *)self isVideo];
  uint64_t v10 = NSStringFromSelector(sel_isVideo);
  [v4 encodeBool:v9 forKey:v10];

  BOOL v11 = [(CXStartCallAction *)self isRelay];
  uint64_t v12 = NSStringFromSelector(sel_isRelay);
  [v4 encodeBool:v11 forKey:v12];

  BOOL v13 = [(CXStartCallAction *)self isUpgrade];
  NSSize v14 = NSStringFromSelector(sel_isUpgrade);
  [v4 encodeBool:v13 forKey:v14];

  BOOL v15 = [(CXStartCallAction *)self isRetry];
  v16 = NSStringFromSelector(sel_isRetry);
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = [(CXStartCallAction *)self isEmergency];
  v18 = NSStringFromSelector(sel_isEmergency);
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = [(CXStartCallAction *)self isVoicemail];
  v20 = NSStringFromSelector(sel_isVoicemail);
  [v4 encodeBool:v19 forKey:v20];

  int64_t v21 = [(CXStartCallAction *)self ttyType];
  v22 = NSStringFromSelector(sel_ttyType);
  [v4 encodeInteger:v21 forKey:v22];

  uint64_t v23 = [(CXStartCallAction *)self localSenderIdentityUUID];
  v24 = NSStringFromSelector(sel_localSenderIdentityUUID);
  [v4 encodeObject:v23 forKey:v24];

  BOOL v25 = [(CXStartCallAction *)self shouldSuppressInCallUI];
  v26 = NSStringFromSelector(sel_shouldSuppressInCallUI);
  [v4 encodeBool:v25 forKey:v26];

  [(CXStartCallAction *)self localLandscapeAspectRatio];
  double v28 = v27;
  double v30 = v29;
  CGFloat v31 = NSStringFromSelector(sel_localLandscapeAspectRatio);
  objc_msgSend(v4, "encodeSize:forKey:", v31, v28, v30);

  [(CXStartCallAction *)self localPortraitAspectRatio];
  double v33 = v32;
  double v35 = v34;
  v36 = NSStringFromSelector(sel_localPortraitAspectRatio);
  objc_msgSend(v4, "encodeSize:forKey:", v36, v33, v35);

  objc_super v37 = [(CXStartCallAction *)self dateStarted];
  v38 = NSStringFromSelector(sel_dateStarted);
  [v4 encodeObject:v37 forKey:v38];
}

- (CGSize)localPortraitAspectRatio
{
  double width = self->_localPortraitAspectRatio.width;
  double height = self->_localPortraitAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->_localPortraitAspectRatio = a3;
}

- (CGSize)localLandscapeAspectRatio
{
  double width = self->_localLandscapeAspectRatio.width;
  double height = self->_localLandscapeAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalLandscapeAspectRatio:(CGSize)a3
{
  self->_localLandscapeAspectRatio = a3;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(NSString *)contactIdentifier
{
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)video
{
  self->_video = video;
}

- (NSDate)dateStarted
{
  return self->_dateStarted;
}

- (void)setDateStarted:(id)a3
{
}

- (BOOL)isRelay
{
  return self->_relay;
}

- (void)setRelay:(BOOL)a3
{
  self->_relay = a3;
}

- (BOOL)isUpgrade
{
  return self->_upgrade;
}

- (void)setUpgrade:(BOOL)a3
{
  self->_upgrade = a3;
}

- (BOOL)isRetry
{
  return self->_retry;
}

- (void)setRetry:(BOOL)a3
{
  self->_retry = a3;
}

- (BOOL)isEmergency
{
  return self->_emergency;
}

- (void)setEmergency:(BOOL)a3
{
  self->_emergency = a3;
}

- (BOOL)isVoicemail
{
  return self->_voicemail;
}

- (void)setVoicemail:(BOOL)a3
{
  self->_voicemail = a3;
}

- (int64_t)ttyType
{
  return self->_ttyType;
}

- (void)setTTYType:(int64_t)a3
{
  self->_ttyType = a3;
}

- (NSUUID)localSenderIdentityUUID
{
  return self->_localSenderIdentityUUID;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityUUID, 0);
  objc_storeStrong((id *)&self->_dateStarted, 0);

  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end