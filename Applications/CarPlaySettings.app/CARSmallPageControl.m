@interface CARSmallPageControl
- (_TtC15CarPlaySettings19CARSmallPageControl)init;
- (double)_indicatorSpacing;
@end

@implementation CARSmallPageControl

- (_TtC15CarPlaySettings19CARSmallPageControl)init
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CARSmallPageControl();
  v2 = [(CARPageControl *)&v5 init];
  v3 = (void *)sub_100057628();
  [(CARSmallPageControl *)v2 setPreferredIndicatorImage:v3];

  return v2;
}

- (double)_indicatorSpacing
{
  return 7.5;
}

@end