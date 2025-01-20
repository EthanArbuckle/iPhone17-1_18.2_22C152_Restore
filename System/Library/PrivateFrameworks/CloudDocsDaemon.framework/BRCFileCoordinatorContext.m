@interface BRCFileCoordinatorContext
- ($3E6A31346F70D3E0191F2ED888AF46F4)sections;
- (BRCFileCoordinatorContext)initWithTracker:(id)a3 queue:(id)a4 startCode:(int)a5 endCode:(int)a6;
- (OS_dispatch_queue)queue;
- (brc_task_tracker)tracker;
- (int)endTracingCode;
- (int)startTracingCode;
- (void)setEndTracingCode:(int)a3;
- (void)setQueue:(id)a3;
- (void)setSections:(id *)a3;
- (void)setStartTracingCode:(int)a3;
- (void)setTracker:(id)a3;
@end

@implementation BRCFileCoordinatorContext

- (BRCFileCoordinatorContext)initWithTracker:(id)a3 queue:(id)a4 startCode:(int)a5 endCode:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BRCFileCoordinatorContext;
  v12 = [(BRCFileCoordinatorContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(BRCFileCoordinatorContext *)v12 setTracker:v10];
    [(BRCFileCoordinatorContext *)v13 setQueue:v11];
    [(BRCFileCoordinatorContext *)v13 setStartTracingCode:v7];
    [(BRCFileCoordinatorContext *)v13 setEndTracingCode:v6];
  }

  return v13;
}

- (brc_task_tracker)tracker
{
  return self->_tracker;
}

- (void)setTracker:(id)a3
{
}

- ($3E6A31346F70D3E0191F2ED888AF46F4)sections
{
  *($3C52EB5FA2A5D3907B44D7DBAB114CA7 *)retstr = *($3C52EB5FA2A5D3907B44D7DBAB114CA7 *)((char *)self + 32);
  return self;
}

- (void)setSections:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_sections.line = *(void *)&a3->var2;
  *(_OWORD *)&self->_sections.sectionID = v3;
}

- (int)startTracingCode
{
  return self->_startTracingCode;
}

- (void)setStartTracingCode:(int)a3
{
  self->_startTracingCode = a3;
}

- (int)endTracingCode
{
  return self->_endTracingCode;
}

- (void)setEndTracingCode:(int)a3
{
  self->_endTracingCode = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end