@interface INAnswerCallIntent
+ (BOOL)supportsSecureCoding;
- (INAnswerCallIntent)initWithAudioRoute:(INCallAudioRoute)audioRoute callIdentifier:(NSString *)callIdentifier;
- (INAnswerCallIntent)initWithAudioRoute:(int64_t)a3;
- (INCallAudioRoute)audioRoute;
- (NSString)callIdentifier;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAudioRoute:(int64_t)a3;
- (void)setCallIdentifier:(id)a3;
@end

@implementation INAnswerCallIntent

- (INCallAudioRoute)audioRoute
{
  v3 = [(INAnswerCallIntent *)self _typedBackingStore];
  int v4 = [v3 hasAudioRoute];
  v5 = [(INAnswerCallIntent *)self _typedBackingStore];
  int v6 = [v5 audioRoute];
  if (v4 && (v6 - 2) <= 2) {
    INCallAudioRoute v7 = qword_18CFC4B68[v6 - 2];
  }
  else {
    INCallAudioRoute v7 = INCallAudioRouteUnknown;
  }

  return v7;
}

- (id)verb
{
  return @"AnswerCall";
}

- (id)domain
{
  return @"Calls";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INAnswerCallIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"audioRoute";
  INCallAudioRoute v3 = [(INAnswerCallIntent *)self audioRoute];
  int v4 = @"speakerphoneAudioRoute";
  v5 = @"heySiriAudioRoute";
  id v6 = @"unknown";
  if (v3 == INCallAudioRouteBluetoothAudioRoute) {
    id v6 = @"bluetoothAudioRoute";
  }
  if (v3 != 1000) {
    v5 = v6;
  }
  if (v3 != INCallAudioRouteSpeakerphoneAudioRoute) {
    int v4 = v5;
  }
  INCallAudioRoute v7 = v4;
  v12[1] = @"callIdentifier";
  v13[0] = v7;
  v8 = [(INAnswerCallIntent *)self callIdentifier];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  if (!v8) {

  }
  return v10;
}

- (void)setCallIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INAnswerCallIntent *)self _typedBackingStore];
  [v5 setCallIdentifier:v4];
}

- (NSString)callIdentifier
{
  v2 = [(INAnswerCallIntent *)self _typedBackingStore];
  INCallAudioRoute v3 = [v2 callIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setAudioRoute:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v3 = 2;
      goto LABEL_7;
    case 1000:
      uint64_t v3 = 4;
      goto LABEL_7;
    case 2:
      uint64_t v3 = 3;
LABEL_7:
      id v4 = [(INAnswerCallIntent *)self _typedBackingStore];
      [v4 setAudioRoute:v3];
      goto LABEL_9;
  }
  id v4 = [(INAnswerCallIntent *)self _typedBackingStore];
  [v4 setHasAudioRoute:0];
LABEL_9:
}

- (INAnswerCallIntent)initWithAudioRoute:(INCallAudioRoute)audioRoute callIdentifier:(NSString *)callIdentifier
{
  id v6 = callIdentifier;
  v10.receiver = self;
  v10.super_class = (Class)INAnswerCallIntent;
  INCallAudioRoute v7 = [(INIntent *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(INAnswerCallIntent *)v7 setAudioRoute:audioRoute];
    [(INAnswerCallIntent *)v8 setCallIdentifier:v6];
  }

  return v8;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INAnswerCallIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INAnswerCallIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INAnswerCallIntent)initWithAudioRoute:(int64_t)a3
{
  return [(INAnswerCallIntent *)self initWithAudioRoute:a3 callIdentifier:0];
}

@end