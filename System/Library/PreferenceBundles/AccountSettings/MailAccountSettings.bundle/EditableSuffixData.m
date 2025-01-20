@interface EditableSuffixData
- (EditableSuffixData)initWithSuffixString:(id)a3;
- (id)suffixString;
- (unint64_t)fieldContentsLastLength;
- (void)setFieldContentsLastLength:(unint64_t)a3;
@end

@implementation EditableSuffixData

- (EditableSuffixData)initWithSuffixString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EditableSuffixData;
  v6 = [(EditableSuffixData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_editableSuffixString, a3);
  }

  return v7;
}

- (id)suffixString
{
  return self->_editableSuffixString;
}

- (unint64_t)fieldContentsLastLength
{
  return self->_lastLength;
}

- (void)setFieldContentsLastLength:(unint64_t)a3
{
  self->_lastLength = a3;
}

- (void).cxx_destruct
{
}

@end