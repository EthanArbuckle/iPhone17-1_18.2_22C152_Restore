@interface _ATXActionMetaData
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldPredict;
- (BOOL)shouldPredictLockScreen;
- (NSString)actionKey;
- (NSString)subtitle;
- (NSString)title;
- (_ATXActionMetaData)initWithCoder:(id)a3;
- (_ATXActionMetaData)initWithTitle:(id)a3 subtitle:(id)a4 shouldPredict:(BOOL)a5 shouldPredictLockScreen:(BOOL)a6 actionKey:(id)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ATXActionMetaData

- (_ATXActionMetaData)initWithTitle:(id)a3 subtitle:(id)a4 shouldPredict:(BOOL)a5 shouldPredictLockScreen:(BOOL)a6 actionKey:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_ATXActionMetaData;
  v15 = [(_ATXActionMetaData *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    title = v15->_title;
    v15->_title = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    subtitle = v15->_subtitle;
    v15->_subtitle = (NSString *)v18;

    v15->_shouldPredict = a5;
    v15->_shouldPredictLockScreen = a6;
    uint64_t v20 = [v14 copy];
    actionKey = v15->_actionKey;
    v15->_actionKey = (NSString *)v20;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ATXActionMetaData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
  uint64_t v7 = [v4 decodeBoolForKey:@"shouldPredict"];
  uint64_t v8 = [v4 decodeBoolForKey:@"shouldPredictLockScreen"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionKey"];

  v10 = [(_ATXActionMetaData *)self initWithTitle:v5 subtitle:v6 shouldPredict:v7 shouldPredictLockScreen:v8 actionKey:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeBool:self->_shouldPredict forKey:@"shouldPredict"];
  [v5 encodeBool:self->_shouldPredictLockScreen forKey:@"shouldPredictLockScreen"];
  [v5 encodeObject:self->_actionKey forKey:@"actionKey"];
}

- (NSString)actionKey
{
  return self->_actionKey;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)shouldPredict
{
  return self->_shouldPredict;
}

- (BOOL)shouldPredictLockScreen
{
  return self->_shouldPredictLockScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actionKey, 0);
}

@end