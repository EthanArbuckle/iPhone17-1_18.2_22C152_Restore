@interface AVTPhysicalizedMorpherDynamic
+ (void)enumerateDynamicsInHierarchy:(void *)a3 forAvatar:(void *)a4 ignoredUpperNodes:(void *)a5 usingBlock:;
- (BOOL)affectsNode:(id)a3;
- (NSString)description;
- (void)evaluateAtTime:(double)a3 physicsController:(id)a4;
- (void)resetTarget;
@end

@implementation AVTPhysicalizedMorpherDynamic

- (NSString)description
{
  v3 = NSString;
  writeMorpher = self->_writeMorpher;
  v5 = [(SCNNode *)self->_drivingNode name];
  v6 = [v3 stringWithFormat:@"<AVTPhysicalizedMorpherDynamic: %p> Morpher %p driven by \"%@\"", self, writeMorpher, v5];

  return (NSString *)v6;
}

+ (void)enumerateDynamicsInHierarchy:(void *)a3 forAvatar:(void *)a4 ignoredUpperNodes:(void *)a5 usingBlock:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a2;
  self;
  v12 = [v8 avatarNode];
  v13 = [v12 childNodeWithName:@"head_JNT" recursively:1];
  v14 = [v8 specializationSettings];
  v15 = [v14 objectForKeyedSubscript:@"dynamics"];
  v16 = [v15 objectForKeyedSubscript:@"dynamic nodes"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __101__AVTPhysicalizedMorpherDynamic_enumerateDynamicsInHierarchy_forAvatar_ignoredUpperNodes_usingBlock___block_invoke;
  v23[3] = &unk_26401F530;
  id v24 = v9;
  id v25 = v12;
  id v26 = v16;
  id v27 = v13;
  id v28 = v8;
  id v29 = v10;
  id v17 = v10;
  id v18 = v8;
  id v19 = v13;
  id v20 = v16;
  id v21 = v12;
  id v22 = v9;
  [v11 enumerateHierarchyUsingBlock:v23];
}

void __101__AVTPhysicalizedMorpherDynamic_enumerateDynamicsInHierarchy_forAvatar_ignoredUpperNodes_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v45 = a2;
  id v50 = [v45 morpher];
  v2 = v50;
  if (v50)
  {
    int v3 = [*(id *)(a1 + 32) containsObject:v45];
    id v51 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v4 = [v50 targets];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v59 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          if (v3)
          {
            id v9 = [*(id *)(*((void *)&v58 + 1) + 8 * i) name];
            char v10 = [v9 containsString:@"upper"];

            if (v10) {
              continue;
            }
          }
          id v11 = [v8 name];
          uint64_t v12 = [v11 rangeOfString:@"_DYN"];
          uint64_t v14 = v13;

          if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = [v8 name];
            v16 = [v15 substringToIndex:v12 + v14];

            [v51 addObject:v16];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }
      while (v5);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v51;
    uint64_t v48 = [obj countByEnumeratingWithState:&v54 objects:v71 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v55;
      *(void *)&long long v17 = 138412546;
      long long v44 = v17;
      while (2)
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v55 != v47) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v54 + 1) + 8 * v18);
          objc_msgSend(*(id *)(a1 + 40), "childNodeWithName:recursively:", v19, 1, v44);
          id v52 = (id)objc_claimAutoreleasedReturnValue();
          if (!v52)
          {
            v43 = avt_default_log();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v66) = 138412290;
              *(void *)((char *)&v66 + 4) = v19;
              _os_log_impl(&dword_20B819000, v43, OS_LOG_TYPE_DEFAULT, "Failed to find physicalized morpher driving node named '%@'", (uint8_t *)&v66, 0xCu);
            }

            goto LABEL_40;
          }
          *(void *)&long long v66 = 0;
          *((void *)&v66 + 1) = &v66;
          uint64_t v67 = 0x3032000000;
          v68 = __Block_byref_object_copy__0;
          v69 = __Block_byref_object_dispose__0;
          id v70 = 0;
          id v20 = *(void **)(a1 + 48);
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __101__AVTPhysicalizedMorpherDynamic_enumerateDynamicsInHierarchy_forAvatar_ignoredUpperNodes_usingBlock___block_invoke_11;
          v53[3] = &unk_26401F508;
          v53[4] = v19;
          v53[5] = &v66;
          [v20 enumerateKeysAndObjectsUsingBlock:v53];
          id v21 = [v19 stringByAppendingString:@"_forward"];
          uint64_t v22 = [v50 _weightIndexForTargetNamed:v21];

          v23 = [v19 stringByAppendingString:@"_backward"];
          uint64_t v24 = [v50 _weightIndexForTargetNamed:v23];

          id v25 = [v19 stringByAppendingString:@"_leftward"];
          uint64_t v26 = [v50 _weightIndexForTargetNamed:v25];

          id v27 = [v19 stringByAppendingString:@"_rightward"];
          uint64_t v28 = [v50 _weightIndexForTargetNamed:v27];

          id v29 = [v19 stringByAppendingString:@"_upward"];
          uint64_t v30 = [v50 _weightIndexForTargetNamed:v29];

          v31 = [v19 stringByAppendingString:@"_downward"];
          uint64_t v32 = [v50 _weightIndexForTargetNamed:v31];

          if ((v22 == 0x7FFFFFFFFFFFFFFFLL || v24 == 0x7FFFFFFFFFFFFFFFLL)
            && (v26 == 0x7FFFFFFFFFFFFFFFLL || v28 == 0x7FFFFFFFFFFFFFFFLL)
            && (v30 == 0x7FFFFFFFFFFFFFFFLL || v32 == 0x7FFFFFFFFFFFFFFFLL))
          {
            v34 = avt_default_log();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              v41 = [v45 name];
              *(_DWORD *)buf = v44;
              v63 = v41;
              __int16 v64 = 2112;
              v65 = v19;
              _os_log_impl(&dword_20B819000, v34, OS_LOG_TYPE_DEFAULT, "Failed to create physicalized morpher dynamic: '%@' driven by '%@'", buf, 0x16u);
            }
          }
          else
          {
            v33 = [*(id *)(*((void *)&v66 + 1) + 40) objectForKeyedSubscript:@"simulation factor"];
            v34 = v33;
            if (v33)
            {
              [v33 floatValue];
              float v36 = v35;
            }
            else
            {
              float v36 = 0.5;
            }
            uint64_t v37 = objc_opt_new();
            *(float *)(v37 + 8) = v36;
            objc_storeStrong((id *)(v37 + 16), *(id *)(a1 + 56));
            objc_storeStrong((id *)(v37 + 24), v52);
            objc_storeStrong((id *)(v37 + 32), v50);
            *(void *)(v37 + 40) = v22;
            *(void *)(v37 + 48) = v24;
            *(void *)(v37 + 56) = v26;
            *(void *)(v37 + 64) = v28;
            *(void *)(v37 + 72) = v30;
            *(void *)(v37 + 80) = v32;
            v38 = [*(id *)(*((void *)&v66 + 1) + 40) objectForKeyedSubscript:@"morph target weight as simulation factor"];
            if (v38)
            {
              v39 = [*(id *)(a1 + 64) effectiveMorphedNodeForTargetName:v38];
              objc_storeStrong((id *)(v37 + 88), v39);
              v40 = [v39 morpher];
              *(void *)(v37 + 96) = [v40 _weightIndexForTargetNamed:v38];
            }
            (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
          }
          _Block_object_dispose(&v66, 8);

          ++v18;
        }
        while (v48 != v18);
        uint64_t v42 = [obj countByEnumeratingWithState:&v54 objects:v71 count:16];
        uint64_t v48 = v42;
        if (v42) {
          continue;
        }
        break;
      }
    }
LABEL_40:

    v2 = v50;
  }
}

void __101__AVTPhysicalizedMorpherDynamic_enumerateDynamicsInHierarchy_forAvatar_ignoredUpperNodes_usingBlock___block_invoke_11(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([*(id *)(a1 + 32) containsString:a2])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (void)evaluateAtTime:(double)a3 physicsController:(id)a4
{
  id v20 = a4;
  float simulationFactor = self->_simulationFactor;
  uint64_t v5 = self->_extraSimulationFactorReadMorpherNode;
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = [(SCNNode *)v5 presentationNode];
    id v8 = [v7 morpher];
    [v8 weightForTargetAtIndex:self->_extraSimulationFactorTargetIndex];
    float v10 = v9;

    float simulationFactor = simulationFactor * v10;
  }
  [v20 offsetFromRestingPositionForNode:self->_drivingNode inCoordinateSpaceOfNode:self->_referenceNode];
  float32x4_t v12 = vmulq_n_f32(v11, simulationFactor);
  float32x4_t v13 = vnegq_f32(v12);
  v12.i32[3] = 0;
  float32x4_t v14 = vmaxnmq_f32(v12, (float32x4_t)0);
  v14.i32[3] = 0;
  float32x4_t v22 = vminnmq_f32(v14, (float32x4_t)xmmword_20B88FDE0);
  v13.i32[3] = 0;
  float32x4_t v15 = vmaxnmq_f32(v13, (float32x4_t)0);
  v15.i32[3] = 0;
  float32x4_t v18 = v15;
  v16 = self->_writeMorpher;
  long long v17 = v16;
  if (self->_leftwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL) {
    -[SCNMorpher setWeight:forTargetAtIndex:](v16, "setWeight:forTargetAtIndex:", v22.f32[0]);
  }
  float32x4_t v19 = vminnmq_f32(v18, (float32x4_t)xmmword_20B88FDE0);
  if (self->_rightwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL) {
    -[SCNMorpher setWeight:forTargetAtIndex:](v17, "setWeight:forTargetAtIndex:", v19.f32[0]);
  }
  if (self->_forwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL) {
    -[SCNMorpher setWeight:forTargetAtIndex:](v17, "setWeight:forTargetAtIndex:", v22.f32[2]);
  }
  if (self->_backwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL) {
    -[SCNMorpher setWeight:forTargetAtIndex:](v17, "setWeight:forTargetAtIndex:", v19.f32[2]);
  }
  if (self->_upwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL) {
    -[SCNMorpher setWeight:forTargetAtIndex:](v17, "setWeight:forTargetAtIndex:", v22.f32[1]);
  }
  if (self->_downwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL) {
    -[SCNMorpher setWeight:forTargetAtIndex:](v17, "setWeight:forTargetAtIndex:", v19.f32[1]);
  }
}

- (void)resetTarget
{
  if (self->_leftwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL) {
    -[SCNMorpher setWeight:forTargetAtIndex:](self->_writeMorpher, "setWeight:forTargetAtIndex:", 0.0);
  }
  if (self->_rightwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL) {
    -[SCNMorpher setWeight:forTargetAtIndex:](self->_writeMorpher, "setWeight:forTargetAtIndex:", 0.0);
  }
  if (self->_forwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL) {
    -[SCNMorpher setWeight:forTargetAtIndex:](self->_writeMorpher, "setWeight:forTargetAtIndex:", 0.0);
  }
  if (self->_backwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL) {
    -[SCNMorpher setWeight:forTargetAtIndex:](self->_writeMorpher, "setWeight:forTargetAtIndex:", 0.0);
  }
  if (self->_upwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL) {
    -[SCNMorpher setWeight:forTargetAtIndex:](self->_writeMorpher, "setWeight:forTargetAtIndex:", 0.0);
  }
  if (self->_downwardMorphTargetIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    writeMorpher = self->_writeMorpher;
    -[SCNMorpher setWeight:forTargetAtIndex:](writeMorpher, "setWeight:forTargetAtIndex:", 0.0);
  }
}

- (BOOL)affectsNode:(id)a3
{
  v4 = [a3 morpher];
  LOBYTE(self) = v4 == self->_writeMorpher;

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraSimulationFactorReadMorpherNode, 0);
  objc_storeStrong((id *)&self->_writeMorpher, 0);
  objc_storeStrong((id *)&self->_drivingNode, 0);
  objc_storeStrong((id *)&self->_referenceNode, 0);
}

@end