@interface LZMADecoder
- (LZMADecoder)init;
- (void)dealloc;
@end

@implementation LZMADecoder

- (LZMADecoder)init
{
  return (LZMADecoder *)sub_100239938(self, 0);
}

- (void)dealloc
{
  lzma_end();
  transaction = self->_transaction;
  self->_transaction = 0;

  v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "(LZMADecoder) Decoder deallocated: %@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)LZMADecoder;
  [(LZMADecoder *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoderError, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end