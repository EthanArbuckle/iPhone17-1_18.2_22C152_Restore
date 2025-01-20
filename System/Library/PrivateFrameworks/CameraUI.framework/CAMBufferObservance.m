@interface CAMBufferObservance
- (BOOL)isEnabled;
- (BOOL)isFulfilled;
- (BOOL)isRemovedOnceEnabled;
- (BOOL)shouldBeFulfilledByChange:(id)a3;
- (CAMBufferObservance)initWithPredicate:(id)a3 removedOnceEnabled:(BOOL)a4;
- (id)predicate;
- (void)fulfillWithChange:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFulfilled:(BOOL)a3;
@end

@implementation CAMBufferObservance

- (CAMBufferObservance)initWithPredicate:(id)a3 removedOnceEnabled:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMBufferObservance;
  v7 = [(CAMBufferObservance *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    v9 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v8;

    v7[8] = a4;
    *(_WORD *)(v7 + 9) = 0;
    v10 = v7;
  }

  return (CAMBufferObservance *)v7;
}

- (BOOL)shouldBeFulfilledByChange:(id)a3
{
  return 1;
}

- (void)fulfillWithChange:(id)a3
{
  if ([(CAMBufferObservance *)self shouldBeFulfilledByChange:a3])
  {
    if (![(CAMBufferObservance *)self isFulfilled]) {
      [(CAMBufferObservance *)self setFulfilled:1];
    }
    uint64_t v4 = [(CAMBufferObservance *)self predicate];
    id v6 = (id)v4;
    if (v4) {
      uint64_t v5 = (*(uint64_t (**)(void))(v4 + 16))();
    }
    else {
      uint64_t v5 = 0;
    }
    [(CAMBufferObservance *)self setEnabled:v5];
  }
}

- (BOOL)isRemovedOnceEnabled
{
  return self->_removedOnceEnabled;
}

- (id)predicate
{
  return self->_predicate;
}

- (BOOL)isFulfilled
{
  return self->_fulfilled;
}

- (void)setFulfilled:(BOOL)a3
{
  self->_fulfilled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
}

@end