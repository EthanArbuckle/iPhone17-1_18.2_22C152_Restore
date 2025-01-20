@interface CalSigTermCancellableTask
+ (BOOL)performCancellableTask:(id)a3;
@end

@implementation CalSigTermCancellableTask

+ (BOOL)performCancellableTask:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  v4 = [[CalSignalSensor alloc] initWithSignal:15];
  v5 = [[CalSignalSensor alloc] initWithSignal:2];
  v6 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__CalSigTermCancellableTask_performCancellableTask___block_invoke;
  v11[3] = &unk_1E56CDBC8;
  id v12 = v6;
  id v7 = v6;
  v8 = (void *)MEMORY[0x192FD8850](v11);
  [(CalSignalSensor *)v4 setFireBlock:v8];
  [(CalSignalSensor *)v5 setFireBlock:v8];
  [(CalSignalSensor *)v4 startSensor];
  [(CalSignalSensor *)v5 startSensor];
  v9 = [v7 token];
  v3[2](v3, v9);

  [(CalSignalSensor *)v4 stopSensor];
  [(CalSignalSensor *)v5 stopSensor];
  LOBYTE(v3) = [v9 isCancelled];

  return (char)v3;
}

uint64_t __52__CalSigTermCancellableTask_performCancellableTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

@end