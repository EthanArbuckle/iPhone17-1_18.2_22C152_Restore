@interface INConnectedCall
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INConnectedCall)initWithAudioRoute:(int64_t)a3;
- (INConnectedCall)initWithCoder:(id)a3;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)audioRoute;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INConnectedCall

- (int64_t)audioRoute
{
  return self->_audioRoute;
}

- (id)_dictionaryRepresentation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"audioRoute";
  v2 = [NSNumber numberWithInteger:self->_audioRoute];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INConnectedCall;
  v6 = [(INConnectedCall *)&v11 description];
  v7 = [(INConnectedCall *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INConnectedCall *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  int64_t audioRoute = self->_audioRoute;
  v7 = @"heySiriAudioRoute";
  v8 = @"unknown";
  if (audioRoute == 2) {
    v8 = @"bluetoothAudioRoute";
  }
  if (audioRoute != 1000) {
    v7 = v8;
  }
  if (audioRoute == 1) {
    v9 = @"speakerphoneAudioRoute";
  }
  else {
    v9 = v7;
  }
  v10 = v9;
  objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v10, @"audioRoute");

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (INConnectedCall)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"audioRoute"];

  return [(INConnectedCall *)self initWithAudioRoute:v4];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (INConnectedCall *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_audioRoute == v4->_audioRoute;
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithInteger:self->_audioRoute];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (INConnectedCall)initWithAudioRoute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INConnectedCall;
  result = [(INConnectedCall *)&v5 init];
  if (result) {
    result->_int64_t audioRoute = a3;
  }
  return result;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKeyedSubscript:@"audioRoute"];
    uint64_t v8 = INCallAudioRouteWithString(v7);

    v9 = (void *)[objc_alloc((Class)a1) initWithAudioRoute:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end