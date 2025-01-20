@interface FMDGenericMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)vibrate;
- (FMDGenericMessage)initWithCoder:(id)a3;
- (NSString)soundName;
- (int)soundDuration;
- (void)encodeWithCoder:(id)a3;
- (void)setSoundDuration:(int)a3;
- (void)setSoundName:(id)a3;
- (void)setVibrate:(BOOL)a3;
@end

@implementation FMDGenericMessage

- (FMDGenericMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDGenericMessage;
  v5 = [(FMDGenericMessage *)&v12 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_vibrate);
    -[FMDGenericMessage setVibrate:](v5, "setVibrate:", [v4 decodeBoolForKey:v6]);

    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromSelector(sel_soundName);
    v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    [(FMDGenericMessage *)v5 setSoundName:v9];

    v10 = NSStringFromSelector(sel_soundDuration);
    -[FMDGenericMessage setSoundDuration:](v5, "setSoundDuration:", [v4 decodeIntForKey:v10]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FMDGenericMessage *)self vibrate];
  v6 = NSStringFromSelector(sel_vibrate);
  [v4 encodeBool:v5 forKey:v6];

  uint64_t v7 = [(FMDGenericMessage *)self soundName];
  v8 = NSStringFromSelector(sel_soundName);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(FMDGenericMessage *)self soundDuration];
  NSStringFromSelector(sel_soundDuration);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInt:v9 forKey:v10];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)vibrate
{
  return self->_vibrate;
}

- (void)setVibrate:(BOOL)a3
{
  self->_vibrate = a3;
}

- (NSString)soundName
{
  return self->_soundName;
}

- (void)setSoundName:(id)a3
{
}

- (int)soundDuration
{
  return self->_soundDuration;
}

- (void)setSoundDuration:(int)a3
{
  self->_soundDuration = a3;
}

- (void).cxx_destruct
{
}

@end