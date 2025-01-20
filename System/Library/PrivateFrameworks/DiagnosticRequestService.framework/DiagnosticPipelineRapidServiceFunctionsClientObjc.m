@interface DiagnosticPipelineRapidServiceFunctionsClientObjc
- (DiagnosticPipelineRapidServiceFunctionsClientObjc)init;
- (DiagnosticPipelineRapidServiceFunctionsClientObjc)initWithEnvironment:(int64_t)a3;
- (int64_t)environment;
- (void)submitRapidPayloadWithBuildVariant:(id)a3 deviceCategory:(id)a4 deviceModel:(id)a5 platform:(id)a6 teamID:(id)a7 issueCategory:(id)a8 contextDictionaryData:(id)a9 requestTime:(unint64_t)a10 build:(id)a11 logType:(id)a12 logSize:(unint64_t)a13 fileName:(id)a14 uploadAttempts:(unsigned int)a15 payload:(id)a16 completionHandler:(id)aBlock;
@end

@implementation DiagnosticPipelineRapidServiceFunctionsClientObjc

- (int64_t)environment
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_environment);
}

- (DiagnosticPipelineRapidServiceFunctionsClientObjc)initWithEnvironment:(int64_t)a3
{
  return (DiagnosticPipelineRapidServiceFunctionsClientObjc *)DiagnosticPipelineRapidServiceFunctionsClient.init(environment:)(a3);
}

- (void)submitRapidPayloadWithBuildVariant:(id)a3 deviceCategory:(id)a4 deviceModel:(id)a5 platform:(id)a6 teamID:(id)a7 issueCategory:(id)a8 contextDictionaryData:(id)a9 requestTime:(unint64_t)a10 build:(id)a11 logType:(id)a12 logSize:(unint64_t)a13 fileName:(id)a14 uploadAttempts:(unsigned int)a15 payload:(id)a16 completionHandler:(id)aBlock
{
  v55 = _Block_copy(aBlock);
  uint64_t v58 = sub_209EDE9D8();
  uint64_t v62 = v17;
  uint64_t v57 = sub_209EDE9D8();
  uint64_t v61 = v18;
  uint64_t v56 = sub_209EDE9D8();
  uint64_t v60 = v19;
  uint64_t v54 = sub_209EDE9D8();
  uint64_t v59 = v20;
  uint64_t v53 = sub_209EDE9D8();
  uint64_t v64 = v21;
  uint64_t v52 = sub_209EDE9D8();
  uint64_t v63 = v22;
  id v23 = a11;
  id v24 = a12;
  id v25 = a14;
  id v26 = a16;
  v27 = self;
  if (a9)
  {
    id v28 = a9;
    uint64_t v51 = sub_209EDE7E8();
    unint64_t v30 = v29;
  }
  else
  {
    uint64_t v51 = 0;
    unint64_t v30 = 0xF000000000000000;
  }
  uint64_t v31 = sub_209EDE9D8();
  uint64_t v33 = v32;

  uint64_t v34 = sub_209EDE9D8();
  uint64_t v36 = v35;

  uint64_t v37 = sub_209EDE9D8();
  uint64_t v39 = v38;

  uint64_t v40 = sub_209EDE7E8();
  uint64_t v42 = v41;
  unint64_t v50 = v41;

  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = v55;
  *((void *)&v49 + 1) = v37;
  *((void *)&v48 + 1) = v36;
  *(void *)&long long v49 = a13;
  *(void *)&long long v48 = v34;
  *((void *)&v47 + 1) = v31;
  *((void *)&v46 + 1) = v30;
  *(void *)&long long v47 = a10;
  *(void *)&long long v46 = v51;
  *(void *)&long long v45 = v52;
  *((void *)&v45 + 1) = v63;
  *(void *)&long long v44 = v53;
  *((void *)&v44 + 1) = v64;
  DiagnosticPipelineRapidServiceFunctionsClient.submitRapidPayload(buildVariant:deviceCategory:deviceModel:platform:teamID:issueCategory:contextDictionaryData:requestTime:build:logType:logSize:fileName:uploadAttempts:payload:completionHandler:)(v58, v62, v57, v61, v56, v60, v54, v59, v44, v45, v46, v47, v33, v48, v49, v39, a15, v40, v42,
    (uint64_t)sub_209ED1130,
    v43);
  swift_release();
  sub_209ED1138(v40, v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_209ED1190(v51, v30);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (DiagnosticPipelineRapidServiceFunctionsClientObjc)init
{
  result = (DiagnosticPipelineRapidServiceFunctionsClientObjc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_container);
}

@end