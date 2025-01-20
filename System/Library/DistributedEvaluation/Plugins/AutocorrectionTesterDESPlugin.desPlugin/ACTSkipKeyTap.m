@interface ACTSkipKeyTap
- (ACTSkipKeyTap)initWithIntendedKey:(id)a3 timestamp:(double)a4;
- (UIKBTree)intendedKey;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTSkipKeyTap

- (ACTSkipKeyTap)initWithIntendedKey:(id)a3 timestamp:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACTSkipKeyTap;
  v8 = [(ACTSkipKeyTap *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_intendedKey, a3);
    v9->_timestamp = a4;
  }

  return v9;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(ACTSkipKeyTap *)self intendedKey];
  v6 = [v5 representedString];
  [(ACTSkipKeyTap *)self timestamp];
  v8 = +[NSString stringWithFormat:@"<%@: intended=%@, t=%.2f>", v4, v6, v7];

  return v8;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ACTSkipKeyTap *)self timestamp];
  double v9 = v8;
  id v10 = [(ACTSkipKeyTap *)self intendedKey];
  [v7 _skipTapTimestamp:v10 intendedKey:v6 typingLog:v9];
}

- (id)shortDescription
{
  v2 = [(ACTSkipKeyTap *)self intendedKey];
  v3 = [v2 representedString];
  v4 = +[NSString stringWithFormat:@"SkipKey intended: %@", v3];

  return v4;
}

- (UIKBTree)intendedKey
{
  return self->_intendedKey;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end