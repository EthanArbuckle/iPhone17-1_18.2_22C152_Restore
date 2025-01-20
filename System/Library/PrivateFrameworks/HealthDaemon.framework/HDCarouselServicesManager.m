@interface HDCarouselServicesManager
- (HDCarouselServicesManager)init;
- (id)takeDisableAOTAssertionForOwnerIdentifier:(id)a3;
- (id)takeSessionAssertionForOwnerIdentifier:(id)a3;
- (id)takeSessionAssertionForOwnerIdentifier:(id)a3 supportsAOT:(BOOL)a4;
@end

@implementation HDCarouselServicesManager

- (HDCarouselServicesManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)HDCarouselServicesManager;
  v2 = [(HDCarouselServicesManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    assertionManager = v2->_assertionManager;
    v2->_assertionManager = v5;

    [(HDAssertionManager *)v2->_assertionManager addObserver:v2 forAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierCarousel" queue:v2->_queue];
  }
  return v2;
}

- (id)takeSessionAssertionForOwnerIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [_HDCarouselSessionAssertion alloc];
  if (v5)
  {
    v10.receiver = v5;
    v10.super_class = (Class)_HDCarouselSessionAssertion;
    v6 = [(HDCarouselServicesManager *)&v10 initWithAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierCarousel" ownerIdentifier:v4];
  }
  else
  {
    v6 = 0;
  }
  if ([(HDAssertionManager *)self->_assertionManager takeAssertion:v6]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  objc_super v8 = v7;

  return v8;
}

- (id)takeSessionAssertionForOwnerIdentifier:(id)a3 supportsAOT:(BOOL)a4
{
  id result = [(HDCarouselServicesManager *)self takeSessionAssertionForOwnerIdentifier:a3];
  if (result) {
    *((unsigned char *)result + 80) = a4;
  }
  return result;
}

- (id)takeDisableAOTAssertionForOwnerIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [_HDDisableAOTAssertion alloc];
  if (v5)
  {
    v8.receiver = v5;
    v8.super_class = (Class)_HDDisableAOTAssertion;
    v6 = [(HDCarouselServicesManager *)&v8 initWithAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierDisableAOT" ownerIdentifier:v4];
  }
  else
  {
    v6 = 0;
  }
  [(HDAssertionManager *)self->_assertionManager takeAssertion:v6];

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end