@interface MLMetalDeviceObserver
- (id)startObservingWithBlock:(id)a3 deviceObserver:(id *)a4;
@end

@implementation MLMetalDeviceObserver

- (id)startObservingWithBlock:(id)a3 deviceObserver:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = MTLCreateSystemDefaultDevice();
  v6 = v5;
  if (v5)
  {
    v11[0] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  if (a4)
  {
    v8 = objc_opt_new();
    id v9 = *a4;
    *a4 = v8;
  }

  return v7;
}

@end