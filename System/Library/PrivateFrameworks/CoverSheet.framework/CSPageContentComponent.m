@interface CSPageContentComponent
- (CSPageContentComponent)init;
- (id)suppressHorizontalBounce:(int64_t)a3;
- (void)setSuppressHorizontalBounce:(int64_t)a3;
@end

@implementation CSPageContentComponent

- (CSPageContentComponent)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSPageContentComponent;
  v2 = [(CSComponent *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CSComponent *)v2 setType:4];
    [(CSPageContentComponent *)v3 setSuppressHorizontalBounce:0x7FFFFFFFFFFFFFFFLL];
  }
  return v3;
}

- (id)suppressHorizontalBounce:(int64_t)a3
{
  return self;
}

- (void)setSuppressHorizontalBounce:(int64_t)a3
{
  if ([(CSComponent *)self flag] != a3)
  {
    [(CSComponent *)self setFlag:a3];
  }
}

@end