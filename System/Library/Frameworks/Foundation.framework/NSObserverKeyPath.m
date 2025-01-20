@interface NSObserverKeyPath
- (NSString)description;
- (void)_receiveBox:(id)a3;
- (void)finishObserving;
- (void)setObservation:(id)a3;
@end

@implementation NSObserverKeyPath

- (void)_receiveBox:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*((_DWORD *)a3 + 6) == 1)
  {
    if ([a3 _isToManyChangeInformation])
    {
      uint64_t v5 = [*((id *)a3 + 1) _toManyPropertyType];
      switch(v5)
      {
        case 2:
          objc_msgSend(*((id *)a3 + 1), "applyChangesToOrderedSet:", -[NSBoundKeyPath mutableOrderedSetValue](self, "mutableOrderedSetValue"));
          break;
        case 1:
          objc_msgSend(*((id *)a3 + 1), "applyChangesToArray:", -[NSBoundKeyPath mutableArrayValue](self, "mutableArrayValue"));
          break;
        case 0:
          objc_msgSend(*((id *)a3 + 1), "applyChangesToSet:", -[NSBoundKeyPath mutableSetValue](self, "mutableSetValue"));
          break;
      }
    }
    else
    {
      [(NSBoundKeyPath *)self setValue:*((void *)a3 + 1)];
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)NSObserverKeyPath;
  [(NSObserverKeyPath *)&v6 _receiveBox:a3];
}

- (void)setObservation:(id)a3
{
  id v5 = [(NSBoundKeyPath *)self rootObject];

  [v5 setObservation:a3 forObservingKeyPath:self];
}

- (void)finishObserving
{
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@: %p> @observer(%@)", objc_opt_class(), self, self->super._keyPath];
}

@end