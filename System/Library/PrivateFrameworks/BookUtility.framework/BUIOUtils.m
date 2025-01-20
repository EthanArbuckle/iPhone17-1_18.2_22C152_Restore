@interface BUIOUtils
+ (CGDataProvider)newCGDataProviderForInputStream:(id)a3;
+ (CGDataProvider)newCGDataProviderForReadChannel:(id)a3;
+ (void)readAllFromChannel:(id)a3 offset:(int64_t)a4 length:(unint64_t)a5 completion:(id)a6;
@end

@implementation BUIOUtils

+ (void)readAllFromChannel:(id)a3 offset:(int64_t)a4 length:(unint64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_21E1D28E4;
  v18[4] = sub_21E1D28F4;
  v11 = (void *)MEMORY[0x263EF8388];
  id v12 = MEMORY[0x263EF8388];
  id v19 = v11;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21E1D28FC;
  v15[3] = &unk_26449D9E0;
  v17 = v18;
  id v13 = v10;
  id v16 = v13;
  objc_msgSend_readFromOffset_length_handler_(v9, v14, a4, a5, v15);

  _Block_object_dispose(v18, 8);
}

+ (CGDataProvider)newCGDataProviderForInputStream:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  CFRetain(v3);
  Sequential = CGDataProviderCreateSequential(v3, &stru_26CF108D0);

  return Sequential;
}

+ (CGDataProvider)newCGDataProviderForReadChannel:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [BUReadChannelInputStreamAdapter alloc];
  Channel = objc_msgSend_initWithReadChannel_(v5, v6, (uint64_t)v4);

  if (objc_msgSend_canSeek(Channel, v8, v9)) {
    v11 = (CGDataProvider *)objc_msgSend_newCGDataProviderForInputStream_(a1, v10, (uint64_t)Channel);
  }
  else {
    v11 = 0;
  }

  return v11;
}

@end