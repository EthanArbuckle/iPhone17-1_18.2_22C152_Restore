@interface GKNATObserver
+ (id)allocWithZone:(_NSZone *)a3;
- (GKNATObserver)initWithOptions:(id)a3;
- (GKNATObserverDelegate)delegate;
- (int)currentNATType;
- (void)setDelegate:(id)a3;
- (void)shouldTryNATCheck;
@end

@implementation GKNATObserver

+ (id)allocWithZone:(_NSZone *)a3
{
  v4 = (objc_class *)a1;
  if (self == a1) {
    v4 = (objc_class *)self;
  }

  return NSAllocateObject(v4, 0, a3);
}

- (GKNATObserver)initWithOptions:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)GKNATObserver;
  [(GKNATObserver *)&v4 doesNotRecognizeSelector:a2];
  return 0;
}

- (void)setDelegate:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)GKNATObserver;
  [(GKNATObserver *)&v3 doesNotRecognizeSelector:a2];
}

- (GKNATObserverDelegate)delegate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)GKNATObserver;
  [(GKNATObserver *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (int)currentNATType
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)GKNATObserver;
  [(GKNATObserver *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (void)shouldTryNATCheck
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)GKNATObserver;
  [(GKNATObserver *)&v2 doesNotRecognizeSelector:a2];
}

@end