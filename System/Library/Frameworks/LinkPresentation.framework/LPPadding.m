@interface LPPadding
- (LPPadding)init;
- (LPPointUnit)bottom;
- (LPPointUnit)leading;
- (LPPointUnit)top;
- (LPPointUnit)trailing;
- (UIEdgeInsets)asInsetsForLTR:(BOOL)a3;
- (id)_lp_CSSText;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBottom:(id)a3;
- (void)setLeading:(id)a3;
- (void)setTop:(id)a3;
- (void)setTrailing:(id)a3;
@end

@implementation LPPadding

- (LPPadding)init
{
  v13.receiver = self;
  v13.super_class = (Class)LPPadding;
  v2 = [(LPPadding *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[LPPointUnit zero];
    top = v2->_top;
    v2->_top = (LPPointUnit *)v3;

    uint64_t v5 = +[LPPointUnit zero];
    leading = v2->_leading;
    v2->_leading = (LPPointUnit *)v5;

    uint64_t v7 = +[LPPointUnit zero];
    bottom = v2->_bottom;
    v2->_bottom = (LPPointUnit *)v7;

    uint64_t v9 = +[LPPointUnit zero];
    trailing = v2->_trailing;
    v2->_trailing = (LPPointUnit *)v9;

    v11 = v2;
  }

  return v2;
}

- (UIEdgeInsets)asInsetsForLTR:(BOOL)a3
{
  BOOL v3 = a3;
  [(LPPointUnit *)self->_top value];
  double v6 = v5;
  if (v3) {
    uint64_t v7 = 16;
  }
  else {
    uint64_t v7 = 32;
  }
  if (v3) {
    uint64_t v8 = 32;
  }
  else {
    uint64_t v8 = 16;
  }
  [*(id *)((char *)&self->super.isa + v7) value];
  double v10 = v9;
  [(LPPointUnit *)self->_bottom value];
  double v12 = v11;
  [*(id *)((char *)&self->super.isa + v8) value];
  double v14 = v13;
  double v15 = v6;
  double v16 = v10;
  double v17 = v12;
  result.right = v14;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (id)_lp_CSSText
{
  BOOL IsLTR = appIsLTR();
  v4 = NSString;
  [(LPPointUnit *)self->_top value];
  uint64_t v6 = v5;
  if (IsLTR) {
    uint64_t v7 = 32;
  }
  else {
    uint64_t v7 = 16;
  }
  if (IsLTR) {
    uint64_t v8 = 16;
  }
  else {
    uint64_t v8 = 32;
  }
  [*(id *)((char *)&self->super.isa + v7) value];
  uint64_t v10 = v9;
  [(LPPointUnit *)self->_bottom value];
  uint64_t v12 = v11;
  [*(id *)((char *)&self->super.isa + v8) value];
  return (id)objc_msgSend(v4, "stringWithFormat:", @"%gpx %gpx %gpx %gpx", v6, v10, v12, v13);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[LPPadding allocWithZone:a3];
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_top, self->_top);
    objc_storeStrong(p_isa + 2, self->_leading);
    objc_storeStrong(p_isa + 3, self->_bottom);
    objc_storeStrong(p_isa + 4, self->_trailing);
    uint64_t v6 = p_isa;
  }

  return p_isa;
}

- (LPPointUnit)top
{
  return self->_top;
}

- (void)setTop:(id)a3
{
}

- (LPPointUnit)leading
{
  return self->_leading;
}

- (void)setLeading:(id)a3
{
}

- (LPPointUnit)bottom
{
  return self->_bottom;
}

- (void)setBottom:(id)a3
{
}

- (LPPointUnit)trailing
{
  return self->_trailing;
}

- (void)setTrailing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailing, 0);
  objc_storeStrong((id *)&self->_bottom, 0);
  objc_storeStrong((id *)&self->_leading, 0);

  objc_storeStrong((id *)&self->_top, 0);
}

@end