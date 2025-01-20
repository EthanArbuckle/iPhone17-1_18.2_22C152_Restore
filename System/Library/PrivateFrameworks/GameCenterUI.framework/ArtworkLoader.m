@interface ArtworkLoader
- (void)imageRequest:(id)a3 didFailWithError:(id)a4;
- (void)imageRequest:(id)a3 didLoadImage:(id)a4;
@end

@implementation ArtworkLoader

- (void)imageRequest:(id)a3 didLoadImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  sub_1AF63BC6C(v5, a4);

  swift_release();
}

- (void)imageRequest:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  sub_1AF63BCE0();

  swift_release();
}

@end