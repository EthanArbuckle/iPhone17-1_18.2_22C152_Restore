@interface _SYMessageTimerContext
- (NSString)identifier;
- (unint64_t)seqno;
- (void)setIdentifier:(id)a3;
- (void)setSeqno:(unint64_t)a3;
@end

@implementation _SYMessageTimerContext

- (unint64_t)seqno
{
  return self->_seqno;
}

- (void)setSeqno:(unint64_t)a3
{
  self->_seqno = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end