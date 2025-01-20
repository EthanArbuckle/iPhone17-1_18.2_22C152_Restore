@interface WKFoundTextRange
+ (id)foundTextRangeWithWebFoundTextRange:(WebFoundTextRange *)a3;
- (BOOL)isEmpty;
- (NSString)frameIdentifier;
- (WebFoundTextRange)webFoundTextRange;
- (id)end;
- (id)start;
- (unint64_t)length;
- (unint64_t)location;
- (unint64_t)order;
- (void)dealloc;
- (void)setFrameIdentifier:(id)a3;
- (void)setLength:(unint64_t)a3;
- (void)setLocation:(unint64_t)a3;
- (void)setOrder:(unint64_t)a3;
@end

@implementation WKFoundTextRange

+ (id)foundTextRangeWithWebFoundTextRange:(WebFoundTextRange *)a3
{
  v4 = objc_alloc_init(WKFoundTextRange);
  [(WKFoundTextRange *)v4 setLocation:a3->var0];
  [(WKFoundTextRange *)v4 setLength:a3->var1];
  if (a3->var2.var0.m_impl.m_ptr) {
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v5 = &stru_1EEA10550;
  }
  [(WKFoundTextRange *)v4 setFrameIdentifier:v5];
  [(WKFoundTextRange *)v4 setOrder:a3->var3];
  v6 = (void *)CFMakeCollectable(v4);

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WKFoundTextRange;
  [(WKFoundTextRange *)&v3 dealloc];
}

- (id)start
{
  unint64_t v3 = [(WKFoundTextRange *)self location];
  unint64_t v4 = [(WKFoundTextRange *)self order];

  return +[WKFoundTextPosition textPositionWithOffset:v3 order:v4];
}

- (id)end
{
  unint64_t v3 = [(WKFoundTextRange *)self location];
  unint64_t v4 = [(WKFoundTextRange *)self length] + v3;
  unint64_t v5 = [(WKFoundTextRange *)self order];

  return +[WKFoundTextPosition textPositionWithOffset:v4 order:v5];
}

- (BOOL)isEmpty
{
  return 0;
}

- (WebFoundTextRange)webFoundTextRange
{
  retstr->var0 = [(WKFoundTextRange *)self location];
  retstr->var1 = [(WKFoundTextRange *)self length];
  unint64_t v5 = [(WKFoundTextRange *)self frameIdentifier];
  WTF::AtomStringImpl::add((uint64_t *)&v8, (WTF::AtomStringImpl *)v5, v6);
  retstr->var2.var0.m_impl.m_ptr = v8;
  result = [(WKFoundTextRange *)self order];
  retstr->var3 = (unint64_t)result;
  return result;
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (NSString)frameIdentifier
{
  return self->_frameIdentifier;
}

- (void)setFrameIdentifier:(id)a3
{
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

@end