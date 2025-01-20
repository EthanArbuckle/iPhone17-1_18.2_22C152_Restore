void sub_4614(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;
  uint64_t vars8;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)qword_1ECB8;
  qword_1ECB8 = (uint64_t)v1;
}

void sub_4684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_4B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_51FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_52F4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) plugIn];
  id v2 = [v1 isPad];

  return v2;
}

void sub_5330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSURL *__cdecl sub_5340(id a1, NSString *a2)
{
  id v2 = (void *)MFCreateURLForContentID();

  return (NSURL *)v2;
}

double sub_536C(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) plugIn];
  [v1 defaultComposeFontPixelSize];
  double v3 = v2;

  return v3;
}

void sub_53B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_53C0(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) plugIn];
  double v2 = [v1 defaultComposeFontFamily];

  return v2;
}

void sub_5410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

MFMimeCharset *__cdecl sub_5420(id a1, NSString *a2, JSValue *a3)
{
  v4 = a2;
  v5 = a3;
  if ([(JSValue *)v5 isNumber])
  {
    v6 = [(JSValue *)v5 toNumber];
    uint64_t v7 = CFStringConvertNSStringEncodingToEncoding((unint64_t)[v6 unsignedIntegerValue]);

    if (v7 == 134217984)
    {
      uint64_t v8 = +[MFMimeCharset charsetForEncoding:134217984];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  uint64_t v8 = [(NSString *)v4 mf_bestMimeCharsetUsingHint:v7];
LABEL_6:
  v9 = (void *)v8;

  return (MFMimeCharset *)v9;
}

void sub_54E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSArray *__cdecl sub_5500(id a1)
{
  v1 = +[JSContext currentThis];
  double v2 = +[JSContext currentContext];
  double v3 = +[WKWebProcessPlugInRangeHandle rangeHandleWithJSValue:v1 inContext:v2];
  v4 = [v3 detectDataWithTypes:2 context:&__NSDictionary0__struct];

  return (NSArray *)v4;
}

void sub_55A0(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

BOOL sub_55CC(id a1)
{
  v1 = +[JSContext currentThis];
  double v2 = [v1 toString];
  unsigned __int8 v3 = objc_msgSend(v2, "ec_isAttribution");

  return v3;
}

void sub_5624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_5640(id a1)
{
  v1 = +[JSContext currentThis];
  double v2 = [v1 toString];
  unsigned __int8 v3 = objc_msgSend(v2, "ec_isForwardSeparator");

  return v3;
}

void sub_5698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v9 - 200));

  _Unwind_Resume(a1);
}

void sub_5C34(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained[6] isEqualToArray:v6] & 1) == 0)
  {
    objc_storeStrong(WeakRetained + 6, a2);
    v5 = [WeakRetained observerProxy];
    [v5 selectedAttachmentIdentifiersDidChange:v6];
  }
}

void sub_5CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_5CFC(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained observerProxy];
  [v4 attachmentTapped:v5];
}

void sub_5D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_5D94(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v3 = [WeakRetained observerProxy];
  [v3 composeBodyFieldSelectionContainsLinkStateDidChange:a2];
}

void sub_5DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_5E14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained observerProxy];
  [v1 composeBodyFieldSelectedLinkTextDidChange];
}

void sub_5E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_5E8C(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 32);
  double v2 = +[JSContext currentContext];
  unsigned __int8 v3 = +[JSValue valueWithBool:v1 inContext:v2];

  return v3;
}

void sub_5F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_setDirty:", objc_msgSend(v3, "toBool"));
}

void sub_5F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_603C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_60DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_61E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_65C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_65EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addMarkupString:*(void *)(a1 + 40) quote:*(unsigned __int8 *)(a1 + 64) emptyFirst:*(unsigned __int8 *)(a1 + 65) prepended:*(unsigned __int8 *)(a1 + 66) composeType:*(void *)(a1 + 56) attachmentInfoByURL:*(void *)(a1 + 48) completionHandler:0];
}

void sub_6748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

id sub_6784(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) jsBodyField];
  id v3 = [v2 invokeMethod:@"bodyInnerHTML" withArguments:&__NSArray0__struct];
  v4 = [v3 toString];
  BOOL v5 = [v4 caseInsensitiveCompare:*(void *)(a1 + 40)] == 0;

  return [*(id *)(a1 + 32) _addMarkupString:*(void *)(a1 + 48) quote:*(unsigned __int8 *)(a1 + 80) emptyFirst:v5 prepended:v5 composeType:*(void *)(a1 + 72) attachmentInfoByURL:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

void sub_6830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_69E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_6A00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) jsBodyField];
  [v2 setObject:v1 forKeyedSubscript:@"_replacementFilenamesByContentID"];
}

void sub_6A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_6B2C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) jsBodyField];
  id v2 = [v3 invokeMethod:@"containsRichText" withArguments:&__NSArray0__struct];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, [v2 toBool]);
}

void sub_6BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_6CB4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) jsBodyField];
  uint64_t v7 = *(void *)(a1 + 40);
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  BOOL v5 = [v3 invokeMethod:@"plainTextContent" withArguments:v4];
  id v6 = [v5 toArray];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
}

void sub_6D9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_6EC0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) jsBodyField];
  uint64_t v7 = *(void *)(a1 + 40);
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  BOOL v5 = [v3 invokeMethod:@"htmlString" withArguments:v4];
  id v6 = [v5 toString];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
}

void sub_6FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_70AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_70D0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) jsBodyField];
  id v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v4 = *(void *)(a1 + 40);
  v21[0] = v3;
  v21[1] = v4;
  BOOL v5 = +[NSArray arrayWithObjects:v21 count:2];
  id v6 = [v2 invokeMethod:@"htmlStringsAttachmentURLsEncodingsAndPlainTextAlternative" withArguments:v5];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"topLevelHTMLString"];
  uint64_t v8 = sub_742C(v7);

  uint64_t v9 = [v6 objectForKeyedSubscript:@"otherHTMLStringsAndAttachmentURLs"];
  if ([v9 isArray])
  {
    v10 = [v9 objectForKeyedSubscript:@"length"];
    unsigned int v11 = [v10 toUInt32];

    uint64_t v12 = v11;
    id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v11];
    if (v11)
    {
      uint64_t v14 = 0;
      do
      {
        v15 = [v9 objectAtIndexedSubscript:v14];
        if ([v15 isString]) {
          [v15 toString];
        }
        else {
        v16 = sub_742C(v15);
        }
        [v13 addObject:v16];

        ++v14;
      }
      while (v12 != v14);
    }
  }
  else
  {
    id v13 = 0;
  }
  v17 = [v6 objectForKeyedSubscript:@"quotedAttachmentsCIDs"];
  v18 = [v17 toArray];

  v19 = [v6 objectForKeyedSubscript:@"stringsAndQuoteLevels"];
  v20 = [v19 toArray];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_7344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_742C(void *a1)
{
  id v1 = a1;
  if ([v1 isObject])
  {
    uint64_t v2 = [v1 objectForKeyedSubscript:@"string"];
    id v3 = [v2 toObject];

    if (v3)
    {
      uint64_t v4 = [v1 objectForKeyedSubscript:@"charset"];
      BOOL v5 = [v4 toObject];

      id v6 = [objc_alloc((Class)ECHTMLStringAndMIMECharset) initWithString:v3 charset:v5];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_7500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_76C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_76D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) jsBodyField];
  uint64_t v2 = [v4 invokeMethod:@"getCaretPosition" withArguments:&__NSArray0__struct];
  id v3 = [v2 toNumber];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

void sub_776C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_7898(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) jsBodyField];
  id v4 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  BOOL v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 57), v4);
  uint64_t v6 = *(void *)(a1 + 40);
  v10[1] = v5;
  v10[2] = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:v10 count:3];
  uint64_t v8 = [v3 invokeMethod:@"insertAttachment" withArguments:v7];
  uint64_t v9 = [v8 toString];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);
}

void sub_79C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_7AFC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) jsBodyField];
  uint64_t v7 = *(void *)(a1 + 40);
  id v4 = +[NSArray arrayWithObjects:&v7 count:1];
  BOOL v5 = [v3 invokeMethod:@"countDuplicatedAttachments" withArguments:v4];
  uint64_t v6 = [v5 toNumber];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
}

void sub_7BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_7D08(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) jsBodyField];
  uint64_t v7 = *(void *)(a1 + 40);
  id v4 = +[NSArray arrayWithObjects:&v7 count:1];
  BOOL v5 = [v3 invokeMethod:@"replaceFilenamePlaceholderWithImage" withArguments:v4];
  uint64_t v6 = [v5 toString];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
}

void sub_7DF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_7FEC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) jsBodyField];
  uint64_t v7 = *(void *)(a1 + 40);
  id v4 = +[NSArray arrayWithObjects:&v7 count:1];
  BOOL v5 = [v3 invokeMethod:@"replaceRichLinkPlaceholderImage" withArguments:v4];
  uint64_t v6 = [v5 toString];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
}

void sub_80D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_81D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t sub_81F4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) jsBodyField];
  uint64_t v6 = *(void *)(a1 + 40);
  id v3 = +[NSArray arrayWithObjects:&v6 count:1];
  id v4 = [v2 invokeMethod:@"removeMediaAttachment" withArguments:v3];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_82B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_83A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_83C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) jsBodyField];
  uint64_t v7 = *(void *)(a1 + 40);
  id v4 = +[NSArray arrayWithObjects:&v7 count:1];
  BOOL v5 = [v3 invokeMethod:@"displayAttachmentWithIdentifierAsSinglePagePDF" withArguments:v4];
  uint64_t v6 = [v5 toString];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
}

void sub_84AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t sub_85B0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = *(unsigned char *)(a1 + 48);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_8674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_875C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_895C(void *a1)
{
  return [*(id *)(a1[4] + 24) invokeMethod:a1[5] withArguments:a1[6]];
}

void sub_8A58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_8D50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_906C(_Unwind_Exception *a1)
{
  uint64_t v9 = v6;

  _Unwind_Resume(a1);
}

void sub_9250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_92E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_955C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_95FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_96F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_9718(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 frame];
  BOOL v5 = [v4 jsNodeForNodeHandle:v3 inWorld:*(void *)(a1 + 32)];

  return v5;
}

void sub_9784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_98BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_99F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9D88(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_9E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MessageBodyDOMQuoteSubparser;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_9F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A12C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_A2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_A320(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Blocked request for %{public}@", buf, 0xCu);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return _CFStringConvertNSStringEncodingToEncoding(encoding);
}

uint64_t MFCreateURLForContentID()
{
  return _MFCreateURLForContentID();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__copyBundleRangeHandleRef(void *a1, const char *a2, ...)
{
  return [a1 _copyBundleRangeHandleRef];
}

id objc_msgSend__jsParser(void *a1, const char *a2, ...)
{
  return [a1 _jsParser];
}

id objc_msgSend__remoteObjectRegistry(void *a1, const char *a2, ...)
{
  return [a1 _remoteObjectRegistry];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_blockRemoteContent(void *a1, const char *a2, ...)
{
  return [a1 blockRemoteContent];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_composeBodyFieldDidChange(void *a1, const char *a2, ...)
{
  return [a1 composeBodyFieldDidChange];
}

id objc_msgSend_composeBodyFieldSelectedLinkTextDidChange(void *a1, const char *a2, ...)
{
  return [a1 composeBodyFieldSelectedLinkTextDidChange];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return [a1 controller];
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return [a1 currentContext];
}

id objc_msgSend_currentThis(void *a1, const char *a2, ...)
{
  return [a1 currentThis];
}

id objc_msgSend_defaultComposeFontFamily(void *a1, const char *a2, ...)
{
  return [a1 defaultComposeFontFamily];
}

id objc_msgSend_defaultComposeFontPixelSize(void *a1, const char *a2, ...)
{
  return [a1 defaultComposeFontPixelSize];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_globalObject(void *a1, const char *a2, ...)
{
  return [a1 globalObject];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isArray(void *a1, const char *a2, ...)
{
  return [a1 isArray];
}

id objc_msgSend_isNull(void *a1, const char *a2, ...)
{
  return [a1 isNull];
}

id objc_msgSend_isNumber(void *a1, const char *a2, ...)
{
  return [a1 isNumber];
}

id objc_msgSend_isObject(void *a1, const char *a2, ...)
{
  return [a1 isObject];
}

id objc_msgSend_isPad(void *a1, const char *a2, ...)
{
  return [a1 isPad];
}

id objc_msgSend_isString(void *a1, const char *a2, ...)
{
  return [a1 isString];
}

id objc_msgSend_jsBodyField(void *a1, const char *a2, ...)
{
  return [a1 jsBodyField];
}

id objc_msgSend_jsContext(void *a1, const char *a2, ...)
{
  return [a1 jsContext];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nodes(void *a1, const char *a2, ...)
{
  return [a1 nodes];
}

id objc_msgSend_normalWorld(void *a1, const char *a2, ...)
{
  return [a1 normalWorld];
}

id objc_msgSend_observerProxy(void *a1, const char *a2, ...)
{
  return [a1 observerProxy];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_parser(void *a1, const char *a2, ...)
{
  return [a1 parser];
}

id objc_msgSend_plugIn(void *a1, const char *a2, ...)
{
  return [a1 plugIn];
}

id objc_msgSend_releaseExternally(void *a1, const char *a2, ...)
{
  return [a1 releaseExternally];
}

id objc_msgSend_remoteContentProxySchemePrefix(void *a1, const char *a2, ...)
{
  return [a1 remoteContentProxySchemePrefix];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_toArray(void *a1, const char *a2, ...)
{
  return [a1 toArray];
}

id objc_msgSend_toBool(void *a1, const char *a2, ...)
{
  return [a1 toBool];
}

id objc_msgSend_toNumber(void *a1, const char *a2, ...)
{
  return [a1 toNumber];
}

id objc_msgSend_toObject(void *a1, const char *a2, ...)
{
  return [a1 toObject];
}

id objc_msgSend_toString(void *a1, const char *a2, ...)
{
  return [a1 toString];
}

id objc_msgSend_toUInt32(void *a1, const char *a2, ...)
{
  return [a1 toUInt32];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_valueWithObject_inContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithObject:inContext:");
}