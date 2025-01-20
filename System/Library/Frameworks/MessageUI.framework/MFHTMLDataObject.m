@interface MFHTMLDataObject
- (ECHTMLStringAndMIMECharset)htmlString;
- (MFHTMLDataObject)initWithHTMLString:(id)a3 otherHTMLStringsAndAttachments:(id)a4 plainTextAlternative:(id)a5 quotedAttachmentsInfo:(id)a6;
- (MFPlainTextDocument)plainTextAlternative;
- (MFQuotedAttachmentsInfo)quotedAttachmentsInfo;
- (NSArray)otherHTMLStringsAndAttachments;
@end

@implementation MFHTMLDataObject

- (MFHTMLDataObject)initWithHTMLString:(id)a3 otherHTMLStringsAndAttachments:(id)a4 plainTextAlternative:(id)a5 quotedAttachmentsInfo:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MFHTMLDataObject;
  v15 = [(MFHTMLDataObject *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_htmlString, a3);
    objc_storeStrong((id *)&v16->_otherHTMLStringsAndAttachments, a4);
    objc_storeStrong((id *)&v16->_plainTextAlternative, a5);
    objc_storeStrong((id *)&v16->_quotedAttachmentsInfo, a6);
  }

  return v16;
}

- (ECHTMLStringAndMIMECharset)htmlString
{
  return self->_htmlString;
}

- (NSArray)otherHTMLStringsAndAttachments
{
  return self->_otherHTMLStringsAndAttachments;
}

- (MFPlainTextDocument)plainTextAlternative
{
  return self->_plainTextAlternative;
}

- (MFQuotedAttachmentsInfo)quotedAttachmentsInfo
{
  return self->_quotedAttachmentsInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quotedAttachmentsInfo, 0);
  objc_storeStrong((id *)&self->_plainTextAlternative, 0);
  objc_storeStrong((id *)&self->_otherHTMLStringsAndAttachments, 0);

  objc_storeStrong((id *)&self->_htmlString, 0);
}

@end