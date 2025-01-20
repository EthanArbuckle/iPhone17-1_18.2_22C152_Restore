@interface MDLMaterial(SCNModelIO)
+ (MDLMaterial)materialWithSCNMaterial:()SCNModelIO;
@end

@implementation MDLMaterial(SCNModelIO)

+ (MDLMaterial)materialWithSCNMaterial:()SCNModelIO
{
  v5 = objc_opt_new();
  v6 = (MDLMaterial *)objc_msgSend([a1 alloc], "initWithName:scatteringFunction:", objc_msgSend(a3, "name"), v5);

  -[MDLMaterial setName:](v6, "setName:", [a3 name]);
  objc_setAssociatedObject(v6, @"SCNSceneKitAssociatedObject", a3, (void *)0x301);
  objc_setAssociatedObject(a3, @"SCNSceneKitAssociatedObject", v6, 0);
  setupMDLMaterialProperty(v6, &cfstr_Emission.isa, (SCNMaterialProperty *)[a3 ambient], MDLMaterialSemanticEmission);
  setupMDLMaterialProperty(v6, &cfstr_Basecolor.isa, (SCNMaterialProperty *)[a3 diffuse], MDLMaterialSemanticBaseColor);
  setupMDLMaterialProperty(v6, &cfstr_Specular.isa, (SCNMaterialProperty *)[a3 specular], MDLMaterialSemanticSpecular);
  setupMDLMaterialProperty(v6, &cfstr_Reflective.isa, (SCNMaterialProperty *)[a3 reflective], MDLMaterialSemanticUserDefined);
  setupMDLMaterialProperty(v6, &cfstr_Opacity.isa, (SCNMaterialProperty *)[a3 transparent], MDLMaterialSemanticOpacity);
  setupMDLMaterialProperty(v6, &cfstr_Metallic.isa, (SCNMaterialProperty *)[a3 metalness], MDLMaterialSemanticMetallic);
  setupMDLMaterialProperty(v6, &cfstr_Roughness.isa, (SCNMaterialProperty *)[a3 roughness], MDLMaterialSemanticRoughness);
  setupMDLMaterialProperty(v6, &cfstr_Ambientocclusi.isa, (SCNMaterialProperty *)[a3 ambientOcclusion], MDLMaterialSemanticAmbientOcclusion);
  setupMDLMaterialProperty(v6, &cfstr_Displacement.isa, (SCNMaterialProperty *)[a3 displacement], MDLMaterialSemanticDisplacement);
  setupMDLMaterialProperty(v6, &cfstr_Normal.isa, (SCNMaterialProperty *)[a3 normal], MDLMaterialSemanticTangentSpaceNormal);
  if ([a3 isDoubleSided]) {
    [(MDLMaterial *)v6 setMaterialFace:2];
  }

  return v6;
}

@end