@interface NSISPlaybackOperationVariableDelegate
- (BOOL)variableIsUserObservable;
- (NSISVariable)variable;
- (NSString)markedConstraintDescription;
- (NSString)variableDescription;
- (id)description;
- (id)firstItem;
- (id)secondItem;
- (int)orientationHint;
- (void)dealloc;
- (void)setMarkedConstraintDescription:(id)a3;
- (void)setOrientationHint:(int)a3;
- (void)setVariable:(id)a3;
- (void)setVariableDescription:(id)a3;
- (void)setVariableIsUserObservable:(BOOL)a3;
@end

@implementation NSISPlaybackOperationVariableDelegate

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSISPlaybackOperationVariableDelegate;
  [(NSISPlaybackOperationVariableDelegate *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = [(NSISPlaybackOperationVariableDelegate *)self markedConstraintDescription];
  if (![(NSString *)v3 length])
  {
    v5.receiver = self;
    v5.super_class = (Class)NSISPlaybackOperationVariableDelegate;
    return [(NSISPlaybackOperationVariableDelegate *)&v5 description];
  }
  return v3;
}

- (id)firstItem
{
  return 0;
}

- (id)secondItem
{
  return 0;
}

- (NSISVariable)variable
{
  return (NSISVariable *)objc_getProperty(self, a2, 8, 1);
}

- (void)setVariable:(id)a3
{
}

- (NSString)variableDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVariableDescription:(id)a3
{
}

- (NSString)markedConstraintDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMarkedConstraintDescription:(id)a3
{
}

- (BOOL)variableIsUserObservable
{
  return self->_variableIsUserObservable;
}

- (void)setVariableIsUserObservable:(BOOL)a3
{
  self->_variableIsUserObservable = a3;
}

- (int)orientationHint
{
  return self->_orientationHint;
}

- (void)setOrientationHint:(int)a3
{
  self->_orientationHint = a3;
}

@end