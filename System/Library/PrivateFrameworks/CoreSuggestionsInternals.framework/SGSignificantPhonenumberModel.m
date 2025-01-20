@interface SGSignificantPhonenumberModel
+ (id)newTransformerInstanceForLanguage:(id)a3;
@end

@implementation SGSignificantPhonenumberModel

+ (id)newTransformerInstanceForLanguage:(id)a3
{
  v40[16] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[SGTransformerInstance defaultWindowAndNgrams];
  v31 = (void *)MEMORY[0x1E4F5DFC0];
  v39 = +[SGEntityMatchingTransformer withTargetMapping:@"SG_TARGET_PHONE" phoneMapping:@"SG_FEATURE_PHONENUMBER" emailMapping:@"SG_FEATURE_EMAIL" addressMapping:@"SG_FEATURE_ADDRESS" andDateMapping:@"SG_FEATURE_DATE"];
  v40[0] = v39;
  v38 = +[SGEntityMappingTransformer withEmailMapping:@"SG_FEATURE_EMAIL" linkMapping:@"SG_FEATURE_LINK"];
  v40[1] = v38;
  v37 = +[SGTokenizerMappingTransformer forLocale:v3 withPersonalNameMapping:@"SG_FEATURE_FULLNAME"];
  v40[2] = v37;
  v36 = +[SGNameMappingTransformer withFullNameMapping:@"SG_FEATURE_FULLNAME" firstNameMapping:@"SG_FEATURE_FIRSTNAME" lastNameMapping:@"SG_FEATURE_LASTNAME" andPossessive:@"SG_POSSESSIVE"];
  v40[3] = v36;
  v35 = +[SGSymbolicMappingTransformer withNumericMapping:@"SG_FEATURE_NUMBER" andSymbolicMapping:@"SG_FEATURE_SYMBOL"];
  v40[4] = v35;
  v34 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_RECENCY" andLanguage:v3];
  v33 = +[SGStringMappingTransformer withMappings:v34];
  v40[5] = v33;
  v30 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_ENTITYTYPE" andLanguage:v3];
  v29 = +[SGStringMappingTransformer withMappings:v30];
  v40[6] = v29;
  v28 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_ADDRESSTYPE" andLanguage:v3];
  v27 = +[SGStringMappingTransformer withMappings:v28];
  v40[7] = v27;
  v26 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_OTHER" andLanguage:v3];
  v25 = +[SGStringMappingTransformer withMappings:v26];
  v40[8] = v25;
  v24 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_EMAILTYPE" andLanguage:v3];
  v23 = +[SGStringMappingTransformer withMappings:v24];
  v40[9] = v23;
  v22 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_CALLTYPE" andLanguage:v3];
  v21 = +[SGStringMappingTransformer withMappings:v22];
  v40[10] = v21;
  v19 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_PHONETYPE" andLanguage:v3];
  v18 = +[SGStringMappingTransformer withMappings:v19];
  v40[11] = v18;
  v5 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_BELONGINGTO" andLanguage:v3];
  v6 = +[SGStringMappingTransformer withMappings:v5];
  v40[12] = v6;
  v7 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_BELONGING" andLanguage:v3];
  v8 = +[SGStringMappingTransformer withMappings:v7];
  v40[13] = v8;
  v20 = v4;
  v9 = [v4 first];
  v10 = +[SGTokenDistanceMappingTransformer withTarget:maxDistance:](SGTokenDistanceMappingTransformer, "withTarget:maxDistance:", @"SG_TARGET_PHONE", [v9 unsignedIntegerValue]);
  v40[14] = v10;
  v11 = (void *)MEMORY[0x1E4F93808];
  v12 = [v4 second];
  v13 = objc_msgSend(v11, "withBucketSize:andNgrams:", 10000, objc_msgSend(v12, "intValue"));
  v40[15] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:16];
  v32 = [v31 withTransformers:v14];

  v15 = +[SGTransformerInstance defaultSessionDescriptorForModelId:@"SignificantPhoneNumber" featureVersion:@"1.4" language:v3 windowAndNgrams:v20];

  v16 = [[SGTransformerInstance alloc] initWithTransformer:v32 sessionDescriptor:v15 modelClass:objc_opt_class()];
  return v16;
}

@end