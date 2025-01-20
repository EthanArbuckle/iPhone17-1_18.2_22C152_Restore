@interface HMFScheduler
+ (id)defaultScheduler;
+ (id)mainScheduler;
- (HMFScheduler)init;
- (HMFScheduler)initWithQueue:(id)a3;
- (id)performBlock:(id)a3;
- (id)performOperation:(id)a3;
- (id)performSelector:(SEL)a3 target:(id)a4 argument:(id)a5;
- (id)performSelector:(SEL)a3 target:(id)a4 argument:(id)a5 qualityOfService:(int64_t)a6;
- (id)performWithQualityOfService:(int64_t)a3 block:(id)a4;
@end

@implementation HMFScheduler

+ (id)defaultScheduler
{
  if (_MergedGlobals_77 != -1) {
    dispatch_once(&_MergedGlobals_77, &__block_literal_global_51);
  }
  v2 = (void *)qword_1EB4EEE48;
  return v2;
}

void __29__HMFScheduler_mainScheduler__block_invoke()
{
  v0 = [HMFScheduler alloc];
  id v3 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v1 = [(HMFScheduler *)v0 initWithQueue:v3];
  v2 = (void *)qword_1EB4EEE58;
  qword_1EB4EEE58 = v1;
}

uint64_t __32__HMFScheduler_defaultScheduler__block_invoke()
{
  qword_1EB4EEE48 = objc_alloc_init(HMFScheduler);
  return MEMORY[0x1F41817F8]();
}

- (HMFScheduler)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMFScheduler;
  v6 = [(HMFScheduler *)&v11 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_operationQueue, a3);
    }
    else
    {
      v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      operationQueue = v7->_operationQueue;
      v7->_operationQueue = v8;

      [(NSOperationQueue *)v7->_operationQueue setName:@"com.apple.HMFoundation.Scheduler"];
    }
  }

  return v7;
}

- (HMFScheduler)init
{
  return [(HMFScheduler *)self initWithQueue:0];
}

- (id)performWithQualityOfService:(int64_t)a3 block:(id)a4
{
  v6 = self;
  v7 = 0;
  if (v6 && a4)
  {
    v8 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:a4];
    v9 = v6;
    id v10 = v8;
    v7 = v10;
    if (v10)
    {
      if (a3 != -1)
      {
        [v10 setQualityOfService:a3];
        if (![v7 queuePriority])
        {
          unint64_t v11 = __ROR8__(a3 - 9, 3);
          if (v11 > 3) {
            uint64_t v12 = 0;
          }
          else {
            uint64_t v12 = qword_19D611970[v11];
          }
          [v7 setQueuePriority:v12];
        }
      }
      [v9[1] addOperation:v7];
    }
  }
  return v7;
}

- (id)performBlock:(id)a3
{
  v4 = self;
  id v5 = 0;
  if (v4)
  {
    if (a3)
    {
      id v5 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:a3];
      if (v5) {
        [(NSOperationQueue *)v4->_operationQueue addOperation:v5];
      }
    }
  }

  return v5;
}

- (id)performOperation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self && v4) {
    [(NSOperationQueue *)self->_operationQueue addOperation:v4];
  }
  return v5;
}

+ (id)mainScheduler
{
  if (qword_1EB4EEE50 != -1) {
    dispatch_once(&qword_1EB4EEE50, &__block_literal_global_2);
  }
  v2 = (void *)qword_1EB4EEE58;
  return v2;
}

- (id)performSelector:(SEL)a3 target:(id)a4 argument:(id)a5
{
  v8 = self;
  v9 = 0;
  if (v8)
  {
    if (a3)
    {
      if (a4)
      {
        id v10 = (objc_class *)MEMORY[0x1E4F28D68];
        id v11 = a5;
        id v12 = a4;
        v9 = (void *)[[v10 alloc] initWithTarget:v12 selector:a3 object:v11];

        if (v9) {
          [(NSOperationQueue *)v8->_operationQueue addOperation:v9];
        }
      }
    }
  }

  return v9;
}

- (id)performSelector:(SEL)a3 target:(id)a4 argument:(id)a5 qualityOfService:(int64_t)a6
{
  id v10 = self;
  id v11 = 0;
  if (v10 && a3 && a4)
  {
    id v12 = (objc_class *)MEMORY[0x1E4F28D68];
    id v13 = a5;
    id v14 = a4;
    v15 = (void *)[[v12 alloc] initWithTarget:v14 selector:a3 object:v13];

    v16 = v10;
    id v17 = v15;
    id v11 = v17;
    if (v17)
    {
      if (a6 != -1)
      {
        [v17 setQualityOfService:a6];
        if (![v11 queuePriority])
        {
          unint64_t v18 = __ROR8__(a6 - 9, 3);
          if (v18 > 3) {
            uint64_t v19 = 0;
          }
          else {
            uint64_t v19 = qword_19D611970[v18];
          }
          [v11 setQueuePriority:v19];
        }
      }
      [v16[1] addOperation:v11];
    }
  }
  return v11;
}

- (void).cxx_destruct
{
}

@end