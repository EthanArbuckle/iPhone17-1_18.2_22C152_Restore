@interface SGSignificantAddressModel
+ (id)newTransformerInstanceForLanguage:(id)a3;
@end

@implementation SGSignificantAddressModel

+ (id)newTransformerInstanceForLanguage:(id)a3
{
  v41[16] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[SGTransformerInstance defaultWindowAndNgrams];
  v40 = +[SGTransformerInstance defaultSessionDescriptorForModelId:featureVersion:language:windowAndNgrams:](SGTransformerInstance, "defaultSessionDescriptorForModelId:featureVersion:language:windowAndNgrams:", @"SignificantPostalAddress", @"1.4", v3);
  v32 = (void *)MEMORY[0x1E4F5DFC0];
  v39 = +[SGEntityMatchingTransformer withTargetMapping:@"SG_TARGET_ADDRESS" phoneMapping:@"SG_FEATURE_PHONENUMBER" emailMapping:@"SG_FEATURE_EMAIL" addressMapping:@"SG_FEATURE_ADDRESS" andDateMapping:@"SG_FEATURE_DATE"];
  v41[0] = v39;
  v38 = +[SGEntityMappingTransformer withEmailMapping:@"SG_FEATURE_EMAIL" linkMapping:@"SG_FEATURE_LINK"];
  v41[1] = v38;
  v37 = +[SGTokenizerMappingTransformer forLocale:v3 withPersonalNameMapping:@"SG_FEATURE_FULLNAME"];
  v41[2] = v37;
  v36 = +[SGNameMappingTransformer withFullNameMapping:@"SG_FEATURE_FULLNAME" firstNameMapping:@"SG_FEATURE_FIRSTNAME" lastNameMapping:@"SG_FEATURE_LASTNAME" andPossessive:@"SG_POSSESSIVE"];
  v41[3] = v36;
  v35 = +[SGSymbolicMappingTransformer withNumericMapping:@"SG_FEATURE_NUMBER" andSymbolicMapping:@"SG_FEATURE_SYMBOL"];
  v41[4] = v35;
  v34 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_RECENCY" andLanguage:v3];
  v33 = +[SGStringMappingTransformer withMappings:v34];
  v41[5] = v33;
  v31 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_ENTITYTYPE" andLanguage:v3];
  v30 = +[SGStringMappingTransformer withMappings:v31];
  v41[6] = v30;
  v29 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_ADDRESSTYPE" andLanguage:v3];
  v28 = +[SGStringMappingTransformer withMappings:v29];
  v41[7] = v28;
  v27 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_OTHER" andLanguage:v3];
  v26 = +[SGStringMappingTransformer withMappings:v27];
  v41[8] = v26;
  v25 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_EMAILTYPE" andLanguage:v3];
  v24 = +[SGStringMappingTransformer withMappings:v25];
  v41[9] = v24;
  v22 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_CALLTYPE" andLanguage:v3];
  v21 = +[SGStringMappingTransformer withMappings:v22];
  v41[10] = v21;
  v20 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_PHONETYPE" andLanguage:v3];
  v19 = +[SGStringMappingTransformer withMappings:v20];
  v41[11] = v19;
  v5 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_BELONGINGTO" andLanguage:v3];
  v6 = +[SGStringMappingTransformer withMappings:v5];
  v41[12] = v6;
  v7 = +[SGModelMappingHelper mappingsForType:@"SG_FEATURE_BELONGING" andLanguage:v3];

  v8 = +[SGStringMappingTransformer withMappings:v7];
  v41[13] = v8;
  v9 = v4;
  v23 = v4;
  v10 = [v4 first];
  v11 = +[SGTokenDistanceMappingTransformer withTarget:maxDistance:](SGTokenDistanceMappingTransformer, "withTarget:maxDistance:", @"SG_TARGET_ADDRESS", [v10 unsignedIntegerValue]);
  v41[14] = v11;
  v12 = (void *)MEMORY[0x1E4F93808];
  v13 = [v9 second];
  v14 = objc_msgSend(v12, "withBucketSize:andNgrams:", 10000, objc_msgSend(v13, "intValue"));
  v41[15] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:16];
  v16 = [v32 withTransformers:v15];

  v17 = [[SGTransformerInstance alloc] initWithTransformer:v16 sessionDescriptor:v40 modelClass:objc_opt_class()];
  return v17;
}

@end