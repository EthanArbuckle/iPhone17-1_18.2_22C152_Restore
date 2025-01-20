@interface PKMathResultAttribution
- (void)setDarkModeImage:(uint64_t)a1;
- (void)setDate:(uint64_t)a1;
- (void)setImage:(uint64_t)a1;
- (void)setString:(uint64_t)a1;
@end

@implementation PKMathResultAttribution

- (void)setImage:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setDarkModeImage:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setString:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setDate:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_darkModeImage, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end