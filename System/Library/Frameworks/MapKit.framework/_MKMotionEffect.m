@interface _MKMotionEffect
- (BOOL)isEnabled;
- (CATransform3D)transformWithTranslationScale:(SEL)a3 rotationScale:(UIOffset)a4;
- (UIOffset)offsetWithScale:(UIOffset)a3;
- (UIOffset)rawOffset;
- (_MKMotionEffectDelegate)delegate;
- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation _MKMotionEffect

- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3
{
  double vertical = a3.vertical;
  double v5 = 0.5 - a3.horizontal * 0.5;
  *(float *)&double v5 = v5;
  v6 = objc_msgSend(&unk_1ED97EE08, "CA_interpolateValue:byFraction:", &unk_1ED97EE20, v5);
  [v6 floatValue];
  self->_offset.horizontal = v7;

  double v8 = 0.5 - vertical * 0.5;
  *(float *)&double v8 = v8;
  v9 = objc_msgSend(&unk_1ED97EE08, "CA_interpolateValue:byFraction:", &unk_1ED97EE20, v8);
  [v9 floatValue];
  self->_offset.double vertical = v10;

  if (self->_enabled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained motionEffectDidUpdate:self];
  }
  return 0;
}

- (UIOffset)rawOffset
{
  double horizontal = self->_offset.horizontal;
  double vertical = self->_offset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (UIOffset)offsetWithScale:(UIOffset)a3
{
  double v3 = a3.horizontal * self->_offset.horizontal;
  double v4 = a3.vertical * self->_offset.vertical;
  result.double vertical = v4;
  result.double horizontal = v3;
  return result;
}

- (CATransform3D)transformWithTranslationScale:(SEL)a3 rotationScale:(UIOffset)a4
{
  double vertical = a5.vertical;
  double v6 = a4.vertical;
  double horizontal = a4.horizontal;
  v9 = (_OWORD *)MEMORY[0x1E4F39B10];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&retstr->m33 = v10;
  long long v11 = v9[7];
  *(_OWORD *)&retstr->m41 = v9[6];
  *(_OWORD *)&retstr->m43 = v11;
  long long v12 = v9[1];
  *(_OWORD *)&retstr->m11 = *v9;
  *(_OWORD *)&retstr->m13 = v12;
  long long v13 = v9[3];
  *(_OWORD *)&retstr->m21 = v9[2];
  *(_OWORD *)&retstr->m23 = v13;
  retstr->m34 = -0.00111111111;
  p_offset = &self->_offset;
  *(double *)&long long v10 = a5.horizontal * self->_offset.horizontal;
  long long v15 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v42.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v42.m33 = v15;
  long long v16 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v42.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v42.m43 = v16;
  long long v17 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v42.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v42.m13 = v17;
  long long v18 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v42.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v42.m23 = v18;
  CATransform3DRotate(&v43, &v42, *(CGFloat *)&v10, 0.0, 1.0, 0.0);
  long long v19 = *(_OWORD *)&v43.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v43.m31;
  *(_OWORD *)&retstr->m33 = v19;
  long long v20 = *(_OWORD *)&v43.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v43.m41;
  *(_OWORD *)&retstr->m43 = v20;
  long long v21 = *(_OWORD *)&v43.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v43.m11;
  *(_OWORD *)&retstr->m13 = v21;
  long long v22 = *(_OWORD *)&v43.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v43.m21;
  *(_OWORD *)&retstr->m23 = v22;
  CGFloat v23 = vertical * p_offset->vertical;
  long long v24 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v42.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v42.m33 = v24;
  long long v25 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v42.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v42.m43 = v25;
  long long v26 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v42.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v42.m13 = v26;
  long long v27 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v42.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v42.m23 = v27;
  CATransform3DRotate(&v43, &v42, v23, 1.0, 0.0, 0.0);
  long long v28 = *(_OWORD *)&v43.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v43.m31;
  *(_OWORD *)&retstr->m33 = v28;
  long long v29 = *(_OWORD *)&v43.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v43.m41;
  *(_OWORD *)&retstr->m43 = v29;
  long long v30 = *(_OWORD *)&v43.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v43.m11;
  *(_OWORD *)&retstr->m13 = v30;
  long long v31 = *(_OWORD *)&v43.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v43.m21;
  *(_OWORD *)&retstr->m23 = v31;
  CGFloat v32 = -(p_offset->horizontal * horizontal);
  *(double *)&long long v31 = -(p_offset->vertical * v6);
  long long v33 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v42.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v42.m33 = v33;
  long long v34 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v42.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v42.m43 = v34;
  long long v35 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v42.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v42.m13 = v35;
  long long v36 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v42.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v42.m23 = v36;
  UIOffset result = CATransform3DTranslate(&v43, &v42, v32, *(CGFloat *)&v31, 0.0);
  long long v38 = *(_OWORD *)&v43.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v43.m31;
  *(_OWORD *)&retstr->m33 = v38;
  long long v39 = *(_OWORD *)&v43.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v43.m41;
  *(_OWORD *)&retstr->m43 = v39;
  long long v40 = *(_OWORD *)&v43.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v43.m11;
  *(_OWORD *)&retstr->m13 = v40;
  long long v41 = *(_OWORD *)&v43.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v43.m21;
  *(_OWORD *)&retstr->m23 = v41;
  return result;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (_MKMotionEffectDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MKMotionEffectDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end