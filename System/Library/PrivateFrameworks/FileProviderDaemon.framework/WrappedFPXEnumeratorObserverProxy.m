@interface WrappedFPXEnumeratorObserverProxy
- (WrappedFPXEnumeratorObserverProxy)initWithTarget:(id)a3;
- (void)didUpdateItem:(id)a3;
- (void)enumerationResultsDidChange;
@end

@implementation WrappedFPXEnumeratorObserverProxy

- (WrappedFPXEnumeratorObserverProxy)initWithTarget:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WrappedFPXEnumeratorObserverProxy;
  v6 = [(WrappedFPXEnumeratorObserverProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_target, a3);
  }

  return v7;
}

- (void)enumerationResultsDidChange
{
  id v2 = [(FPXEnumeratorObserver *)self->_target remoteObjectProxyWithErrorHandler:&__block_literal_global_17];
  [v2 enumerationResultsDidChange];
}

void __64__WrappedFPXEnumeratorObserverProxy_enumerationResultsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __64__WrappedFPXEnumeratorObserverProxy_enumerationResultsDidChange__block_invoke_cold_1(v2);
  }
}

- (void)didUpdateItem:(id)a3
{
  target = self->_target;
  id v4 = a3;
  id v5 = [(FPXEnumeratorObserver *)target remoteObjectProxyWithErrorHandler:&__block_literal_global_16];
  [v5 didUpdateItem:v4];
}

void __51__WrappedFPXEnumeratorObserverProxy_didUpdateItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __51__WrappedFPXEnumeratorObserverProxy_didUpdateItem___block_invoke_cold_1(v2);
  }
}

- (void).cxx_destruct
{
}

void __64__WrappedFPXEnumeratorObserverProxy_enumerationResultsDidChange__block_invoke_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] Error on did change: %@", v4, v5, v6, v7, v8);
}

void __51__WrappedFPXEnumeratorObserverProxy_didUpdateItem___block_invoke_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] Error on did update item: %@", v4, v5, v6, v7, v8);
}

@end