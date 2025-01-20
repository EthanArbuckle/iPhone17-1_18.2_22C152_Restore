@interface _JavascriptOperation
- (NSString)javascript;
- (_JavascriptOperation)initWithJavascript:(id)a3 completion:(id)a4;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setJavascript:(id)a3;
- (void)submitJavascript:(id)a3 finishBlock:(id)a4;
@end

@implementation _JavascriptOperation

- (_JavascriptOperation)initWithJavascript:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_JavascriptOperation;
  v9 = [(_JavascriptOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_javascript, a3);
    v11 = _Block_copy(v8);
    id completion = v10->_completion;
    v10->_id completion = v11;
  }
  return v10;
}

- (void)submitJavascript:(id)a3 finishBlock:(id)a4
{
  id v6 = a4;
  javascript = self->_javascript;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53___JavascriptOperation_submitJavascript_finishBlock___block_invoke;
  v9[3] = &unk_1E6D567F8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [a3 evaluateJavaScript:javascript completionHandler:v9];
}

- (NSString)javascript
{
  return self->_javascript;
}

- (void)setJavascript:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_javascript, 0);
}

@end