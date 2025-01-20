@interface BMEventBinarySteppingImplementor
- (BOOL)isStarting;
- (BOOL)isValidWithContext:(id)a3 error:(id *)a4;
- (void)setStarting:(BOOL)a3;
@end

@implementation BMEventBinarySteppingImplementor

- (BOOL)isValidWithContext:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)isStarting
{
  return self->starting;
}

- (void)setStarting:(BOOL)a3
{
  self->starting = a3;
}

@end