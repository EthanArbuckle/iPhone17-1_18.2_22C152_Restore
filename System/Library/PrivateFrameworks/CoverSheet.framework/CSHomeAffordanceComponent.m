@interface CSHomeAffordanceComponent
- (CSHomeAffordanceComponent)init;
- (id)suppressTeachableMomentsAnimation:(int64_t)a3;
- (id)viewStyle:(unint64_t)a3;
- (unint64_t)viewStyle;
- (void)setSuppressTeachableMomentsAnimation:(int64_t)a3;
- (void)setViewStyle:(unint64_t)a3;
@end

@implementation CSHomeAffordanceComponent

- (CSHomeAffordanceComponent)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSHomeAffordanceComponent;
  v2 = [(CSComponent *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CSComponent *)v2 setType:12];
    [(CSHomeAffordanceComponent *)v3 setSuppressTeachableMomentsAnimation:0x7FFFFFFFFFFFFFFFLL];
  }
  return v3;
}

- (id)viewStyle:(unint64_t)a3
{
  return self;
}

- (id)suppressTeachableMomentsAnimation:(int64_t)a3
{
  return self;
}

- (void)setViewStyle:(unint64_t)a3
{
  objc_super v5 = [(CSComponent *)self value];
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  char v7 = [v5 isEqualToNumber:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = [NSNumber numberWithUnsignedInteger:a3];
    [(CSComponent *)self setValue:v8];
  }
}

- (void)setSuppressTeachableMomentsAnimation:(int64_t)a3
{
  if ([(CSComponent *)self flag] != a3)
  {
    [(CSComponent *)self setFlag:a3];
  }
}

- (unint64_t)viewStyle
{
  v2 = [(CSComponent *)self value];
  v3 = v2;
  if (v2) {
    unint64_t v4 = (int)[v2 intValue];
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

@end