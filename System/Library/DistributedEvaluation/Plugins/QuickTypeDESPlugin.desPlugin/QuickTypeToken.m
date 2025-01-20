@interface QuickTypeToken
- (BOOL)isOOV;
- (NSString)string;
- (QuickTypeToken)initWithString:(id)a3 tokenID:(unsigned int)a4;
- (id)description;
- (unint64_t)chracterCount;
- (unsigned)tokenID;
- (void)setChracterCount:(unint64_t)a3;
- (void)setString:(id)a3;
- (void)setTokenID:(unsigned int)a3;
@end

@implementation QuickTypeToken

- (QuickTypeToken)initWithString:(id)a3 tokenID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)QuickTypeToken;
  v7 = [(QuickTypeToken *)&v14 init];
  if (v7)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_B180;
    v9[3] = &unk_188D0;
    v9[4] = &v10;
    objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, objc_msgSend(v6, "length"), 2, v9);
    [(QuickTypeToken *)v7 setString:v6];
    [(QuickTypeToken *)v7 setTokenID:v4];
    [(QuickTypeToken *)v7 setChracterCount:v11[3]];
    _Block_object_dispose(&v10, 8);
  }

  return v7;
}

- (BOOL)isOOV
{
  if ([(QuickTypeToken *)self tokenID]) {
    return 0;
  }
  uint64_t v4 = [(QuickTypeToken *)self string];
  BOOL v3 = CEMStringContainsEmoji() == 0;

  return v3;
}

- (id)description
{
  BOOL v3 = [(QuickTypeToken *)self string];
  uint64_t v4 = +[NSString stringWithFormat:@"%@ (%d)", v3, [(QuickTypeToken *)self tokenID]];

  return v4;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setString:(id)a3
{
}

- (unsigned)tokenID
{
  return self->_tokenID;
}

- (void)setTokenID:(unsigned int)a3
{
  self->_tokenID = a3;
}

- (unint64_t)chracterCount
{
  return self->_chracterCount;
}

- (void)setChracterCount:(unint64_t)a3
{
  self->_chracterCount = a3;
}

- (void).cxx_destruct
{
}

@end