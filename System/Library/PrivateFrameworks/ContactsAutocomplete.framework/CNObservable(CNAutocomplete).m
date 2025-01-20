@interface CNObservable(CNAutocomplete)
- (id)activityIndicatingObservableWithActivityDidStartHandler:()CNAutocomplete activityDidStopHandler:;
- (id)autocompleteTimeoutAfterDelay:()CNAutocomplete doOnTimeout:scheduler:;
- (id)networkObservableWithActivityDidStartHandler:()CNAutocomplete activityDidStopHandler:timeoutDelay:subscriptionDelay:scheduler:;
- (uint64_t)localObservableWithScheduler:()CNAutocomplete;
- (uint64_t)localObservableWithScheduler:()CNAutocomplete doOnTimeout:;
@end

@implementation CNObservable(CNAutocomplete)

- (id)autocompleteTimeoutAfterDelay:()CNAutocomplete doOnTimeout:scheduler:
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a1 doOnError:&__block_literal_global_14];
  v11 = [MEMORY[0x1E4F5A480] emptyObservable];
  v12 = [v10 onError:v11];

  v13 = NSString;
  v14 = [a1 debugDescription];
  v15 = [v13 stringWithFormat:@"%@, %@", v14, a1];

  v16 = [MEMORY[0x1E4F5A480] emptyObservable];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __84__CNObservable_CNAutocomplete__autocompleteTimeoutAfterDelay_doOnTimeout_scheduler___block_invoke_3;
  v22[3] = &unk_1E63DDAD0;
  id v23 = v15;
  id v24 = v8;
  id v17 = v8;
  id v18 = v15;
  v19 = [v16 doOnSubscribe:v22];

  v20 = [v12 timeoutAfterDelay:v19 alternateObservable:v9 schedule:a2];

  return v20;
}

- (id)activityIndicatingObservableWithActivityDidStartHandler:()CNAutocomplete activityDidStopHandler:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  id v9 = v8;
  if (v6)
  {
    uint64_t v10 = [v8 doOnSubscribe:v6];

    id v9 = (void *)v10;
  }
  if (v7)
  {
    uint64_t v11 = [v9 doOnTerminate:v7];

    id v9 = (void *)v11;
  }

  return v9;
}

- (uint64_t)localObservableWithScheduler:()CNAutocomplete
{
  return [a1 localObservableWithScheduler:a3 doOnTimeout:0];
}

- (uint64_t)localObservableWithScheduler:()CNAutocomplete doOnTimeout:
{
  return [a1 autocompleteTimeoutAfterDelay:a4 doOnTimeout:a3 scheduler:2.0];
}

- (id)networkObservableWithActivityDidStartHandler:()CNAutocomplete activityDidStopHandler:timeoutDelay:subscriptionDelay:scheduler:
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  v15 = [a1 autocompleteTimeoutAfterDelay:0 doOnTimeout:v12 scheduler:a2];
  v16 = [v15 activityIndicatingObservableWithActivityDidStartHandler:v14 activityDidStopHandler:v13];

  id v17 = [v16 delaySubscription:v12 scheduler:a3];

  return v17;
}

@end