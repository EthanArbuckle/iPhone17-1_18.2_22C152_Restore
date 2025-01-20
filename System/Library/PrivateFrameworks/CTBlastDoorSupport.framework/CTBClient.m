@interface CTBClient
- (AutoBugCaptureProtocol)autoBugCaptureHelper;
- (CTBClient)init;
- (CTBClient)initWithAutoBugCaptureHelper:(id)a3;
- (id)unpackBootstrappingInfoXMLData:(id)a3 error:(id *)a4;
- (id)unpackCPIMMessageData:(id)a3 error:(id *)a4;
- (id)unpackCPMGroupManagementXMLData:(id)a3 error:(id *)a4;
- (id)unpackChatBotMessageJSONData:(id)a3 options:(UnpackOptions)a4 error:(id *)a5;
- (id)unpackChatBotRenderInformationJSONData:(id)a3 error:(id *)a4;
- (id)unpackClientAuthenticityRequestXMLData:(id)a3 error:(id *)a4;
- (id)unpackFileTransferDescriptorXMLData:(id)a3 error:(id *)a4;
- (id)unpackGeoPushLocationXMLData:(id)a3 error:(id *)a4;
- (id)unpackIMCompositionIndicationXMLData:(id)a3 error:(id *)a4;
- (id)unpackIMDNXMLData:(id)a3 error:(id *)a4;
- (id)unpackIMRevokeXMLData:(id)a3 error:(id *)a4;
- (id)unpackProvisioningXMLData:(id)a3 error:(id *)a4;
- (id)unpackSIPConferenceInfoXMLData:(id)a3 error:(id *)a4;
- (id)unpackSIPResourceListsXMLData:(id)a3 error:(id *)a4;
@end

@implementation CTBClient

- (CTBClient)init
{
  v3 = objc_alloc_init(AutoBugCaptureHelper);
  v4 = [(CTBClient *)self initWithAutoBugCaptureHelper:v3];

  return v4;
}

- (CTBClient)initWithAutoBugCaptureHelper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTBClient;
  v6 = [(CTBClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_autoBugCaptureHelper, a3);
  }

  return v7;
}

- (AutoBugCaptureProtocol)autoBugCaptureHelper
{
  return self->_autoBugCaptureHelper;
}

- (void).cxx_destruct
{
}

- (id)unpackProvisioningXMLData:(id)a3 error:(id *)a4
{
  return sub_249582500(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_249580050);
}

- (id)unpackBootstrappingInfoXMLData:(id)a3 error:(id *)a4
{
  return sub_249582500(self, (uint64_t)a2, a3, (uint64_t)a4, sub_249580230);
}

- (id)unpackCPIMMessageData:(id)a3 error:(id *)a4
{
  return sub_249582500(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_24958053C);
}

- (id)unpackFileTransferDescriptorXMLData:(id)a3 error:(id *)a4
{
  return sub_249582500(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_249580740);
}

- (id)unpackGeoPushLocationXMLData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_2495B6640();
  unint64_t v9 = v8;

  uint64_t v10 = sub_2495B69F0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_249582644(v7, v9);
  uint64_t v14 = sub_24957B944(v6, v7, v9, (uint8_t **)((char *)&v19 - v13));
  *(void *)&long long v19 = &v19;
  MEMORY[0x270FA5388](v14);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))((char *)&v19 - v13, (char *)&v19 - v13, v10);
  v23.fLatitude = sub_24959FB8C((uint64_t)&v19 - v13);
  ctb::bridging::makeOptional(v23, (uint64_t)&v20);
  long long v19 = v20;
  uint64_t v15 = v21;
  id v16 = objc_allocWithZone((Class)CTBGeoPushLocationWrapper);
  uint64_t v21 = v15;
  long long v20 = v19;
  id v17 = objc_msgSend(v16, sel_initWithWrapped_, &v20);
  (*(void (**)(char *, uint64_t))(v11 + 8))((char *)&v19 - v13, v10);

  sub_2495825EC(v7, v9);

  return v17;
}

- (id)unpackIMDNXMLData:(id)a3 error:(id *)a4
{
  return sub_249582500(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_249580B94);
}

- (id)unpackSIPConferenceInfoXMLData:(id)a3 error:(id *)a4
{
  return sub_249582500(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_249580FBC);
}

- (id)unpackSIPResourceListsXMLData:(id)a3 error:(id *)a4
{
  return sub_249582500(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_24958119C);
}

- (id)unpackCPMGroupManagementXMLData:(id)a3 error:(id *)a4
{
  return sub_249582500(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_249581394);
}

- (id)unpackIMCompositionIndicationXMLData:(id)a3 error:(id *)a4
{
  return sub_249582500(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_249581564);
}

- (id)unpackChatBotMessageJSONData:(id)a3 options:(UnpackOptions)a4 error:(id *)a5
{
  id v7 = a3;
  unint64_t v8 = self;
  uint64_t v9 = sub_2495B6640();
  unint64_t v11 = v10;

  id v12 = sub_249581734(v9, v11, *(_WORD *)&a4 & 0x1FF);
  sub_2495825EC(v9, v11);

  return v12;
}

- (id)unpackChatBotRenderInformationJSONData:(id)a3 error:(id *)a4
{
  return sub_249582500(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_249581F58);
}

- (id)unpackClientAuthenticityRequestXMLData:(id)a3 error:(id *)a4
{
  return sub_249582500(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_249582138);
}

- (id)unpackIMRevokeXMLData:(id)a3 error:(id *)a4
{
  return sub_249582500(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_249582330);
}

@end