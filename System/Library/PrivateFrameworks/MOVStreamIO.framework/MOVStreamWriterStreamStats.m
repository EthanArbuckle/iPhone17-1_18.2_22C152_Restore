@interface MOVStreamWriterStreamStats
- (MOVStreamWriterStreamStats)init;
- (unint64_t)attemptCount;
- (unint64_t)fifoItemCount;
- (unint64_t)visitCount;
- (unint64_t)writeCount;
- (void)setAttemptCount:(unint64_t)a3;
- (void)setFifoItemCount:(unint64_t)a3;
- (void)setVisitCount:(unint64_t)a3;
- (void)setWriteCount:(unint64_t)a3;
@end

@implementation MOVStreamWriterStreamStats

- (MOVStreamWriterStreamStats)init
{
  v5.receiver = self;
  v5.super_class = (Class)MOVStreamWriterStreamStats;
  v2 = [(MOVStreamWriterStreamStats *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MOVStreamWriterStreamStats *)v2 setFifoItemCount:0];
    [(MOVStreamWriterStreamStats *)v3 setVisitCount:0];
    [(MOVStreamWriterStreamStats *)v3 setAttemptCount:0];
    [(MOVStreamWriterStreamStats *)v3 setWriteCount:0];
  }
  return v3;
}

- (unint64_t)fifoItemCount
{
  return self->_fifoItemCount;
}

- (void)setFifoItemCount:(unint64_t)a3
{
  self->_fifoItemCount = a3;
}

- (unint64_t)visitCount
{
  return self->_visitCount;
}

- (void)setVisitCount:(unint64_t)a3
{
  self->_visitCount = a3;
}

- (unint64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(unint64_t)a3
{
  self->_attemptCount = a3;
}

- (unint64_t)writeCount
{
  return self->_writeCount;
}

- (void)setWriteCount:(unint64_t)a3
{
  self->_writeCount = a3;
}

@end