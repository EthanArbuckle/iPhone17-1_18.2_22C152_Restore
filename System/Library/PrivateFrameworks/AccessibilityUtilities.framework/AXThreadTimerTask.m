@interface AXThreadTimerTask
- (BOOL)isActive;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (id)block;
- (void)run;
- (void)runAfterDelay:(float)a3;
- (void)setActive:(BOOL)a3;
- (void)setBlock:(id)a3;
- (void)setCancel:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
@end

@implementation AXThreadTimerTask

- (void)setBlock:(id)a3
{
  v4 = (void *)[a3 copy];
  id block = self->_block;
  self->_id block = v4;

  MEMORY[0x1F41817F8](v4, block);
}

- (void)run
{
  if (![(AXThreadTimerTask *)self isCancelled])
  {
    [(AXThreadTimerTask *)self setActive:1];
    (*((void (**)(void))self->_block + 2))();
    [(AXThreadTimerTask *)self setActive:0];
  }

  [(AXThreadTimerTask *)self setFinished:1];
}

- (void)runAfterDelay:(float)a3
{
}

- (id)block
{
  return self->_block;
}

- (BOOL)isCancelled
{
  return self->cancel;
}

- (void)setCancel:(BOOL)a3
{
  self->cancel = a3;
}

- (BOOL)isFinished
{
  return self->finished;
}

- (void)setFinished:(BOOL)a3
{
  self->finished = a3;
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (void).cxx_destruct
{
}

@end