@interface UIStackView
- (void)_maps_removeArrangedSubview:(id)a3;
- (void)_maps_setArrangedSubviews:(id)a3;
- (void)_maps_setArrangedSubviews:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation UIStackView

- (void)_maps_setArrangedSubviews:(id)a3
{
  id v4 = a3;
  v5 = [(UIStackView *)self arrangedSubviews];
  v6 = +[NSMutableArray arrayWithArray:v5];

  [v6 removeObjectsInArray:v4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [(UIStackView *)self _maps_removeArrangedSubview:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * (void)j);
        -[UIStackView removeArrangedSubview:](self, "removeArrangedSubview:", v17, (void)v18);
        [(UIStackView *)self addArrangedSubview:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
}

- (void)_maps_setArrangedSubviews:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (a4)
  {
    uint64_t v10 = [(UIStackView *)self arrangedSubviews];
    v11 = [v9 differenceFromArray:v10];

    if ([v11 hasChanges])
    {
      id v12 = +[GroupAnimation animation];
      [v12 setDuration:UINavigationControllerHideShowBarDuration];
      id v13 = [v11 removals];
      id v14 = [v13 count];

      if (v14)
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_18CF0;
        v29[3] = &unk_724C8;
        id v30 = v11;
        v31 = self;
        [v12 addAnimations:v29];
      }
      uint64_t v15 = +[GroupAnimation animation];
      [v15 setDuration:UINavigationControllerHideShowBarDuration];
      [v15 setPreventsAnimationDuringPreparation:1];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_18E1C;
      v26[3] = &unk_724C8;
      id v9 = v11;
      id v27 = v9;
      v28 = self;
      [v15 addPreparation:v26];
      v16 = [v9 insertions];
      id v17 = [v16 count];

      if (v17)
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_19020;
        v24[3] = &unk_60EC8;
        id v25 = v9;
        [v15 addAnimations:v24];
      }
      if (v8) {
        [v15 addCompletion:v8];
      }
      long long v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472;
      long long v21 = sub_19130;
      long long v22 = &unk_72608;
      id v23 = v15;
      id v18 = v15;
      [v12 addCompletion:&v19];
      objc_msgSend(v12, "runWithCurrentOptions", v19, v20, v21, v22);
    }
    else
    {
      id v9 = v11;
    }
  }
  else
  {
    [(UIStackView *)self _maps_setArrangedSubviews:v9];
  }
}

- (void)_maps_removeArrangedSubview:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = [(UIStackView *)self subviews];
    unsigned int v5 = [v4 containsObject:v6];

    if (v5)
    {
      [(UIStackView *)self removeArrangedSubview:v6];
      [v6 removeFromSuperview];
    }
  }
}

@end