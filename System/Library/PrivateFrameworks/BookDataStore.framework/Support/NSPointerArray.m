@interface NSPointerArray
- (void)bds_chainSuccessAndErrorCompletionSelectorCallsForSelector:(SEL)a3 successSoFar:(BOOL)a4 errorSoFar:(id)a5 completion:(id)a6;
- (void)bds_chainUntilNoErrorCompletionSelectorCallsForSelector:(SEL)a3 successSoFar:(BOOL)a4 errorSoFar:(id)a5 completion:(id)a6;
@end

@implementation NSPointerArray

- (void)bds_chainSuccessAndErrorCompletionSelectorCallsForSelector:(SEL)a3 successSoFar:(BOOL)a4 errorSoFar:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([(NSPointerArray *)self count] && !v10 && v7)
  {
    v12 = [(NSPointerArray *)self pointerAtIndex:0];
    v13 = v12;
    if (v12)
    {
      v14 = (void (*)(void *, SEL, void *))[v12 methodForSelector:a3];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000DB64;
      v19[3] = &unk_10025F938;
      v19[4] = self;
      SEL v21 = a3;
      id v20 = v11;
      v14(v13, a3, v19);
    }
    else
    {
      v17 = (void (**)(id, void, void *))objc_retainBlock(v11);
      if (v17)
      {
        v18 = +[NSError errorWithDomain:@"BDSArrayAdditionsErrorDomain" code:1000 userInfo:0];
        v17[2](v17, 0, v18);
      }
    }
  }
  else
  {
    id v15 = objc_retainBlock(v11);
    v16 = v15;
    if (v15) {
      (*((void (**)(id, BOOL, id))v15 + 2))(v15, v7, v10);
    }
  }
}

- (void)bds_chainUntilNoErrorCompletionSelectorCallsForSelector:(SEL)a3 successSoFar:(BOOL)a4 errorSoFar:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (![(NSPointerArray *)self count])
  {
    v14 = (void (**)(void))objc_retainBlock(v10);
    id v15 = v14;
    if (v14)
    {
      v16 = v14[2];
LABEL_9:
      v16();
    }
LABEL_10:

    goto LABEL_15;
  }
  if (!v9)
  {
    v17 = (void (**)(void))objc_retainBlock(v10);
    id v15 = v17;
    if (v17)
    {
      v16 = v17[2];
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v11 = [(NSPointerArray *)self pointerAtIndex:0];
  v12 = v11;
  if (v11)
  {
    v13 = (void (*)(void *, SEL, void *))[v11 methodForSelector:a3];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000DD8C;
    v20[3] = &unk_10025F938;
    v20[4] = self;
    SEL v22 = a3;
    id v21 = v10;
    v13(v12, a3, v20);
  }
  else
  {
    v18 = (void (**)(id, void, void *))objc_retainBlock(v10);
    if (v18)
    {
      v19 = +[NSError errorWithDomain:@"BDSArrayAdditionsErrorDomain" code:1000 userInfo:0];
      v18[2](v18, 0, v19);
    }
  }

LABEL_15:
}

@end