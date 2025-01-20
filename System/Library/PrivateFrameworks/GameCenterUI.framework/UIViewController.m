@interface UIViewController
@end

@implementation UIViewController

void __113__UIViewController_GKChallengeAdditions___gkPresentSendDialogForChallenge_selectPlayers_defaultMessage_complete___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) _gkPresentChallengeVC:v4];
}

uint64_t __113__UIViewController_GKChallengeAdditions___gkPresentSendDialogForChallenge_selectPlayers_defaultMessage_complete___block_invoke_2(void *a1, void *a2)
{
  [a2 count];
  if (*MEMORY[0x1E4F63830]
    || ([*(id *)(*(void *)(a1[6] + 8) + 40) presentingViewController],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    if (!a1[5])
    {
      v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) navigationController];
      id v4 = (id)[v3 popToViewController:a1[4] animated:1];
    }
  }
  else
  {
    v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) presentingViewController];

    if (v6) {
      [*(id *)(*(void *)(a1[6] + 8) + 40) dismissViewControllerAnimated:1 completion:&__block_literal_global_134];
    }
  }
  uint64_t result = a1[5];
  if (result)
  {
    v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

@end