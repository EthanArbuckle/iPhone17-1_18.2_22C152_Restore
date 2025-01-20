@interface INStartCallRequestMetadata
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)appInferred;
- (BOOL)isEqual:(id)a3;
- (INStartCallRequestMetadata)initWithAppInferred:(BOOL)a3;
- (INStartCallRequestMetadata)initWithCoder:(id)a3;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INStartCallRequestMetadata

- (BOOL)appInferred
{
  return self->_appInferred;
}

- (id)_dictionaryRepresentation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"appInferred";
  v2 = [NSNumber numberWithBool:self->_appInferred];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INStartCallRequestMetadata;
  v6 = [(INStartCallRequestMetadata *)&v11 description];
  v7 = [(INStartCallRequestMetadata *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INStartCallRequestMetadata *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  v6 = [NSNumber numberWithBool:self->_appInferred];
  objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v6, @"appInferred");

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (INStartCallRequestMetadata)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"appInferred"];

  return [(INStartCallRequestMetadata *)self initWithAppInferred:v4];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (INStartCallRequestMetadata *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_appInferred == v4->_appInferred;
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithBool:self->_appInferred];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (INStartCallRequestMetadata)initWithAppInferred:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INStartCallRequestMetadata;
  result = [(INStartCallRequestMetadata *)&v5 init];
  if (result) {
    result->_appInferred = a3;
  }
  return result;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKeyedSubscript:@"appInferred"];
    uint64_t v8 = [v7 BOOLValue];

    v9 = (void *)[objc_alloc((Class)a1) initWithAppInferred:v8];
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