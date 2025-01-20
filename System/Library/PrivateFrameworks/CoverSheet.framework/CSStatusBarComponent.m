@interface CSStatusBarComponent
- (CSStatusBarComponent)init;
- (id)fakeStatusBar:(int64_t)a3;
- (id)fakeStatusBarLevel:(id)a3;
- (void)setFakeStatusBar:(int64_t)a3;
- (void)setFakeStatusBarLevel:(id)a3;
@end

@implementation CSStatusBarComponent

- (CSStatusBarComponent)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSStatusBarComponent;
  v2 = [(CSComponent *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CSComponent *)v2 setType:2];
    [(CSStatusBarComponent *)v3 setFakeStatusBar:0x7FFFFFFFFFFFFFFFLL];
  }
  return v3;
}

- (id)fakeStatusBar:(int64_t)a3
{
  return self;
}

- (id)fakeStatusBarLevel:(id)a3
{
  return self;
}

- (void)setFakeStatusBar:(int64_t)a3
{
  if ([(CSComponent *)self flag] != a3)
  {
    [(CSComponent *)self setFlag:a3];
  }
}

- (void)setFakeStatusBarLevel:(id)a3
{
  id v6 = a3;
  id v4 = [(CSComponent *)self value];

  objc_super v5 = v6;
  if (v4 != v6)
  {
    [(CSComponent *)self setValue:v6];
    objc_super v5 = v6;
  }
}

@end