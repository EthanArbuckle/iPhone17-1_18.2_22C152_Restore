@interface BPSScreenStringObj
+ (id)screenStringsWithArray:(id)a3;
- (BPSScreenStringObj)initWithArray:(id)a3;
- (NSString)compact;
- (NSString)regular;
- (NSString)size394h;
- (NSString)size430h;
- (NSString)size446h;
- (NSString)size448h;
- (NSString)size484h;
- (NSString)size496h;
- (NSString)size502h;
- (void)setCompact:(id)a3;
- (void)setRegular:(id)a3;
- (void)setSize394h:(id)a3;
- (void)setSize430h:(id)a3;
- (void)setSize446h:(id)a3;
- (void)setSize448h:(id)a3;
- (void)setSize484h:(id)a3;
- (void)setSize496h:(id)a3;
- (void)setSize502h:(id)a3;
@end

@implementation BPSScreenStringObj

+ (id)screenStringsWithArray:(id)a3
{
  id v3 = a3;
  v4 = [[BPSScreenStringObj alloc] initWithArray:v3];

  return v4;
}

- (BPSScreenStringObj)initWithArray:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BPSScreenStringObj;
  v5 = [(BPSScreenStringObj *)&v25 init];
  if (v5)
  {
    if ([v4 count])
    {
      uint64_t v6 = [v4 objectAtIndexedSubscript:0];
      compact = v5->_compact;
      v5->_compact = (NSString *)v6;
    }
    if ((unint64_t)[v4 count] >= 2)
    {
      uint64_t v8 = [v4 objectAtIndexedSubscript:1];
      regular = v5->_regular;
      v5->_regular = (NSString *)v8;
    }
    if ((unint64_t)[v4 count] >= 3)
    {
      uint64_t v10 = [v4 objectAtIndexedSubscript:2];
      size394h = v5->_size394h;
      v5->_size394h = (NSString *)v10;
    }
    if ((unint64_t)[v4 count] >= 4)
    {
      uint64_t v12 = [v4 objectAtIndexedSubscript:3];
      size448h = v5->_size448h;
      v5->_size448h = (NSString *)v12;
    }
    if ((unint64_t)[v4 count] >= 5)
    {
      uint64_t v14 = [v4 objectAtIndexedSubscript:4];
      size430h = v5->_size430h;
      v5->_size430h = (NSString *)v14;
    }
    if ((unint64_t)[v4 count] >= 6)
    {
      uint64_t v16 = [v4 objectAtIndexedSubscript:5];
      size484h = v5->_size484h;
      v5->_size484h = (NSString *)v16;
    }
    if ((unint64_t)[v4 count] >= 7)
    {
      uint64_t v18 = [v4 objectAtIndexedSubscript:6];
      size502h = v5->_size502h;
      v5->_size502h = (NSString *)v18;
    }
    if ((unint64_t)[v4 count] >= 8)
    {
      uint64_t v20 = [v4 objectAtIndexedSubscript:7];
      size446h = v5->_size446h;
      v5->_size446h = (NSString *)v20;
    }
    if ((unint64_t)[v4 count] >= 9)
    {
      uint64_t v22 = [v4 objectAtIndexedSubscript:8];
      size496h = v5->_size496h;
      v5->_size496h = (NSString *)v22;
    }
  }

  return v5;
}

- (NSString)compact
{
  return self->_compact;
}

- (void)setCompact:(id)a3
{
}

- (NSString)regular
{
  return self->_regular;
}

- (void)setRegular:(id)a3
{
}

- (NSString)size394h
{
  return self->_size394h;
}

- (void)setSize394h:(id)a3
{
}

- (NSString)size448h
{
  return self->_size448h;
}

- (void)setSize448h:(id)a3
{
}

- (NSString)size430h
{
  return self->_size430h;
}

- (void)setSize430h:(id)a3
{
}

- (NSString)size484h
{
  return self->_size484h;
}

- (void)setSize484h:(id)a3
{
}

- (NSString)size502h
{
  return self->_size502h;
}

- (void)setSize502h:(id)a3
{
}

- (NSString)size446h
{
  return self->_size446h;
}

- (void)setSize446h:(id)a3
{
}

- (NSString)size496h
{
  return self->_size496h;
}

- (void)setSize496h:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size496h, 0);
  objc_storeStrong((id *)&self->_size446h, 0);
  objc_storeStrong((id *)&self->_size502h, 0);
  objc_storeStrong((id *)&self->_size484h, 0);
  objc_storeStrong((id *)&self->_size430h, 0);
  objc_storeStrong((id *)&self->_size448h, 0);
  objc_storeStrong((id *)&self->_size394h, 0);
  objc_storeStrong((id *)&self->_regular, 0);

  objc_storeStrong((id *)&self->_compact, 0);
}

@end