@interface GEOMotionContext
- (BOOL)isCycling;
- (BOOL)isDriving;
- (BOOL)isMoving;
- (BOOL)isRunning;
- (BOOL)isWalking;
- (GEOMotionContextDelegate)delegate;
- (NSString)description;
- (unint64_t)confidence;
- (unint64_t)exitType;
- (unint64_t)motionType;
- (void)dealloc;
- (void)motionContextProvider:(id)a3 didUpdateMotion:(unint64_t)a4 exitType:(unint64_t)a5 confidence:(unint64_t)a6;
- (void)setDelegate:(id)a3;
- (void)startMotionUpdatesWithProvider:(id)a3;
- (void)stopMotionUpdates;
@end

@implementation GEOMotionContext

- (void)dealloc
{
  [(GEOMotionContext *)self stopMotionUpdates];
  v3.receiver = self;
  v3.super_class = (Class)GEOMotionContext;
  [(GEOMotionContext *)&v3 dealloc];
}

- (void)startMotionUpdatesWithProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
  id v5 = a3;
  [(GEOMotionContextProvider *)self->_provider setMotionDelegate:self];
  [(GEOMotionContextProvider *)self->_provider startMotionUpdates];
}

- (void)stopMotionUpdates
{
  [(GEOMotionContextProvider *)self->_provider stopMotionUpdates];
  provider = self->_provider;
  self->_provider = 0;
}

- (BOOL)isMoving
{
  return self->_motionType & 1;
}

- (BOOL)isWalking
{
  return (LOBYTE(self->_motionType) >> 1) & 1;
}

- (BOOL)isRunning
{
  return (LOBYTE(self->_motionType) >> 2) & 1;
}

- (BOOL)isCycling
{
  return (LOBYTE(self->_motionType) >> 3) & 1;
}

- (BOOL)isDriving
{
  return (LOBYTE(self->_motionType) >> 4) & 1;
}

- (void)motionContextProvider:(id)a3 didUpdateMotion:(unint64_t)a4 exitType:(unint64_t)a5 confidence:(unint64_t)a6
{
  self->_motionType = a4;
  self->_exitType = a5;
  self->_confidence = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained motionContextDidUpdateMotion:self];
}

- (NSString)description
{
  if ([(GEOMotionContext *)self isWalking])
  {
    objc_super v3 = @"Walking";
  }
  else if ([(GEOMotionContext *)self isRunning])
  {
    objc_super v3 = @"Running";
  }
  else if ([(GEOMotionContext *)self isCycling])
  {
    objc_super v3 = @"Cycling";
  }
  else if ([(GEOMotionContext *)self isDriving])
  {
    objc_super v3 = @"Driving";
  }
  else if ([(GEOMotionContext *)self isMoving])
  {
    objc_super v3 = @"Moving";
  }
  else
  {
    objc_super v3 = @"No motion";
  }
  if ([(GEOMotionContext *)self exitType])
  {
    unint64_t v4 = [(GEOMotionContext *)self exitType];
    id v5 = @"may be exiting vehicle";
    if (v4 == 2) {
      id v5 = @"exited vehicle";
    }
    v6 = NSString;
    v7 = v5;
    v8 = [v6 stringWithFormat:@"%@, %@, (%d)", v3, v7, -[GEOMotionContext confidence](self, "confidence")];
  }
  else
  {
    v8 = [NSString stringWithFormat:@"%@ (%d)", v3, -[GEOMotionContext confidence](self, "confidence")];
  }

  return (NSString *)v8;
}

- (unint64_t)motionType
{
  return self->_motionType;
}

- (unint64_t)exitType
{
  return self->_exitType;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (GEOMotionContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOMotionContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_provider, 0);
}

@end