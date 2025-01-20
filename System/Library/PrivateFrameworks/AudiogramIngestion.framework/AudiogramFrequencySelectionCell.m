@interface AudiogramFrequencySelectionCell
- (_TtC18AudiogramIngestion31AudiogramFrequencySelectionCell)initWithCoder:(id)a3;
- (_TtC18AudiogramIngestion31AudiogramFrequencySelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation AudiogramFrequencySelectionCell

- (_TtC18AudiogramIngestion31AudiogramFrequencySelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_23F120DC0();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency) = 0;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequencySelected) = 0;
    v6 = (void *)sub_23F120D90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency) = 0;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequencySelected) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionCell();
  v7 = [(AudiogramFrequencySelectionCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC18AudiogramIngestion31AudiogramFrequencySelectionCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequencySelected) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionCell();
  return [(AudiogramFrequencySelectionCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency));
}

@end