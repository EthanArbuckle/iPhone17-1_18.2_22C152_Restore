@interface CDMProtobufConverter
+ (id)nluRequestJsonToSIRINLUWithProtoJson:(id)a3;
+ (id)nluResponseFromSIRINLUEXTERNALCDMNluResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)nluResponseFromSIRINLUWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializeExternalCdmPlannerResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializeExternalNluRequestWithRequest:(id)a3 formatType:(id)a4;
+ (id)serializeExternalNluResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializeExternalSubwordEmbeddingResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializeITFMParserRequestWithRequest:(id)a3 formatType:(id)a4;
+ (id)serializeITFMParserResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializeMDRequestWithRequest:(id)a3 formatType:(id)a4;
+ (id)serializeMDResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializeMRRequestWithRequest:(id)a3 formatType:(id)a4;
+ (id)serializeMRResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializeNlv4ParserRequestWithRequest:(id)a3 formatType:(id)a4;
+ (id)serializeNlv4ParserResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializePSCParserRequestWithRequest:(id)a3 formatType:(id)a4;
+ (id)serializePSCParserResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializePreprocessingWrapperWithWrapper:(id)a3 formatType:(id)a4;
+ (id)serializeSNLCParserRequestWithRequest:(id)a3 formatType:(id)a4;
+ (id)serializeSNLCParserResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializeSSURequestWithRequest:(id)a3 formatType:(id)a4;
+ (id)serializeSSUResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializeSpanMatchResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializeTokenizerResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)serializeUaaPParserRequestWithRequest:(id)a3 formatType:(id)a4;
+ (id)serializeUaaPParserResponseWithResponse:(id)a3 formatType:(id)a4;
+ (id)siriExternalCdmPlannerRequestJsonToObjWithProto2Json:(id)a3;
+ (id)siriExternalNluRequestJsonToObjWithProto2Json:(id)a3;
+ (id)siriExternalSubwordEmbeddingRequestJsonToObjWithProto2Json:(id)a3;
+ (id)siriInternalMatchingSpanJsonToObjWithProto2Json:(id)a3;
- (_TtC13CDMFoundation20CDMProtobufConverter)init;
@end

@implementation CDMProtobufConverter

+ (id)nluRequestJsonToSIRINLUWithProtoJson:(id)a3
{
  return sub_2263EA944((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))static CDMProtobufConverter.nluRequestJsonToSIRINLU(protoJson:));
}

+ (id)nluResponseFromSIRINLUWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263EA618((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))static CDMProtobufConverter.nluResponseFromSIRINLU(response:formatType:));
}

+ (id)serializeTokenizerResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeTokenizerResponse(response:formatType:));
}

+ (id)serializeSpanMatchResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeSpanMatchResponse(response:formatType:));
}

+ (id)serializeNlv4ParserRequestWithRequest:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeNlv4ParserRequest(request:formatType:));
}

+ (id)serializeNlv4ParserResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeNlv4ParserResponse(response:formatType:));
}

+ (id)serializeMDRequestWithRequest:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeMDRequest(request:formatType:));
}

+ (id)serializeMDResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeMDResponse(response:formatType:));
}

+ (id)serializeMRRequestWithRequest:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeMRRequest(request:formatType:));
}

+ (id)serializeMRResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeMRResponse(response:formatType:));
}

+ (id)serializeSNLCParserRequestWithRequest:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeSNLCParserRequest(request:formatType:));
}

+ (id)serializeSNLCParserResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeSNLCParserResponse(response:formatType:));
}

+ (id)serializeITFMParserRequestWithRequest:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeITFMParserRequest(request:formatType:));
}

+ (id)serializeITFMParserResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeITFMParserResponse(response:formatType:));
}

+ (id)serializeSSURequestWithRequest:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeSSURequest(request:formatType:));
}

+ (id)serializeSSUResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeSSUResponse(response:formatType:));
}

+ (id)serializePSCParserRequestWithRequest:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializePSCParserRequest(request:formatType:));
}

+ (id)serializePSCParserResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializePSCParserResponse(response:formatType:));
}

+ (id)serializeUaaPParserRequestWithRequest:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeUaaPParserRequest(request:formatType:));
}

+ (id)serializeUaaPParserResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeUaaPParserResponse(response:formatType:));
}

+ (id)serializeExternalNluRequestWithRequest:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeExternalNluRequest(request:formatType:));
}

+ (id)serializeExternalNluResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeExternalNluResponse(response:formatType:));
}

+ (id)serializeExternalSubwordEmbeddingResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeExternalSubwordEmbeddingResponse(response:formatType:));
}

+ (id)serializeExternalCdmPlannerResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializeExternalCdmPlannerResponse(response:formatType:));
}

+ (id)serializePreprocessingWrapperWithWrapper:(id)a3 formatType:(id)a4
{
  return sub_2263E992C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void *, uint64_t, uint64_t))static CDMProtobufConverter.serializePreprocessingWrapper(wrapper:formatType:));
}

+ (id)siriExternalNluRequestJsonToObjWithProto2Json:(id)a3
{
  return sub_2263EA944((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))static CDMProtobufConverter.siriExternalNluRequestJsonToObj(proto2Json:));
}

+ (id)siriExternalSubwordEmbeddingRequestJsonToObjWithProto2Json:(id)a3
{
  return sub_2263EA944((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))static CDMProtobufConverter.siriExternalSubwordEmbeddingRequestJsonToObj(proto2Json:));
}

+ (id)siriExternalCdmPlannerRequestJsonToObjWithProto2Json:(id)a3
{
  return sub_2263EA944((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))static CDMProtobufConverter.siriExternalCdmPlannerRequestJsonToObj(proto2Json:));
}

+ (id)nluResponseFromSIRINLUEXTERNALCDMNluResponseWithResponse:(id)a3 formatType:(id)a4
{
  return sub_2263EA618((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, static CDMProtobufConverter.nluResponseFromSIRINLUEXTERNALCDMNluResponse(response:formatType:));
}

+ (id)siriInternalMatchingSpanJsonToObjWithProto2Json:(id)a3
{
  return sub_2263EA944((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))static CDMProtobufConverter.siriInternalMatchingSpanJsonToObj(proto2Json:));
}

- (_TtC13CDMFoundation20CDMProtobufConverter)init
{
  return (_TtC13CDMFoundation20CDMProtobufConverter *)CDMProtobufConverter.init()();
}

@end