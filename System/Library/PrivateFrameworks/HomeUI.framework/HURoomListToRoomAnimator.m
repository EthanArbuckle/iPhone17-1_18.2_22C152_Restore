@interface HURoomListToRoomAnimator
- (BOOL)isPresenting;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setPresenting:(BOOL)a3;
@end

@implementation HURoomListToRoomAnimator

- (double)transitionDuration:(id)a3
{
  return 0.2;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x1E4F43EB0]];
  v6 = [v4 viewControllerForKey:*MEMORY[0x1E4F43EC0]];
  v7 = [v5 view];
  v8 = [v6 view];
  [v7 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if ([(HURoomListToRoomAnimator *)self isPresenting])
  {
    v17 = [v4 containerView];
    [v17 addSubview:v8];

    objc_msgSend(v8, "setFrame:", v10, v12, v14, v16);
    [v8 setAlpha:0.0];
    v18 = (void *)MEMORY[0x1E4F42FF0];
    [(HURoomListToRoomAnimator *)self transitionDuration:v4];
    double v20 = v19;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __46__HURoomListToRoomAnimator_animateTransition___block_invoke;
    v37[3] = &unk_1E6386018;
    v21 = &v38;
    id v38 = v8;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __46__HURoomListToRoomAnimator_animateTransition___block_invoke_2;
    v35[3] = &unk_1E6386730;
    v22 = &v36;
    id v36 = v4;
    id v23 = v4;
    v24 = v37;
    v25 = v35;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F42FF0];
    [(HURoomListToRoomAnimator *)self transitionDuration:v4];
    double v20 = v26;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __46__HURoomListToRoomAnimator_animateTransition___block_invoke_3;
    v33[3] = &unk_1E6386018;
    v21 = &v34;
    id v34 = v7;
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __46__HURoomListToRoomAnimator_animateTransition___block_invoke_4;
    v31 = &unk_1E6386730;
    v22 = &v32;
    id v32 = v4;
    id v27 = v4;
    v24 = v33;
    v25 = &v28;
  }
  objc_msgSend(v18, "animateWithDuration:delay:options:animations:completion:", 2, v24, v25, v20, 0.0, v28, v29, v30, v31);
}

uint64_t __46__HURoomListToRoomAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __46__HURoomListToRoomAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

uint64_t __46__HURoomListToRoomAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __46__HURoomListToRoomAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

@end