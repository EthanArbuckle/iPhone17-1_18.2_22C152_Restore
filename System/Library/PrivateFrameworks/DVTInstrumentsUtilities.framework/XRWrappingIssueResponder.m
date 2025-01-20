@interface XRWrappingIssueResponder
- (XRWrappingIssueResponder)init;
- (XRWrappingIssueResponder)initWithNextResponder:(id)a3 prototype:(id)a4;
- (void)handleIssue:(id)a3 type:(signed __int16)a4 from:(id)a5;
@end

@implementation XRWrappingIssueResponder

- (XRWrappingIssueResponder)initWithNextResponder:(id)a3 prototype:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)XRWrappingIssueResponder;
  v8 = [(XRWrappingIssueResponder *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_nextResponder, v6);
    objc_storeStrong((id *)&v9->_prototype, a4);
  }

  return v9;
}

- (XRWrappingIssueResponder)init
{
  id v6 = [XRStandardIssueResponder _defaultResponder:a2 withIssue:v2 withContext:v3 withOptions:v4];
  v10 = [MEMORY[0x263F087E8] dvtiuErrorWithCode:v7 error:v8];
  Responder_prototype = (XRWrappingIssueResponder *)[self initWithNextResponder_prototype:v11 nextResponder:v6 nextResponder_prototype:v10 nextResponder_prototype_:v12];

  return Responder_prototype;
}

- (void)handleIssue:(id)a3 type:(signed __int16)a4 from:(id)a5
{
  uint64_t v6 = a4;
  id v48 = a3;
  prototype = self->_prototype;
  id v9 = a5;
  v14 = [prototype performSelector:v10 withObject:v11 withObject:v12 withObject:v13];
  v19 = [v14 mutableCopyWithZone:v15];

  [v19 setObject:v20 forKeyedSubscript:(uint64_t)v48];
  v26 = [self->_prototype performSelector:v22 withObject:v23 withObject:v24 withObject:v25];
  v31 = [v48 performSelector:v27 withObject:v28 withObject:v29 withObject:v30];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextResponder);
  v37 = WeakRetained;
  if (v26 == v31)
  {
    [v33 handleIssue:v6 type:v9];
  }
  else
  {
    v38 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = [self->_prototype _domain:v33 withError:v34 withError:v35 withError:v36];
    uint64_t v44 = [self->_prototype v40:v41 v42:v42 v43:v43];
    v46 = [v38 errorWithDomain:v45 code:v39 userInfo:v44];
    [v37 handleIssue:v47 type:v6 from:v9];

    id v9 = (id)v39;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextResponder);

  objc_storeStrong((id *)&self->_prototype, 0);
}

@end